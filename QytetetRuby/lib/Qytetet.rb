#encoding: utf-8
require_relative "Sorpresa"
require_relative "TipoSorpresa"
require_relative "tablero"
require_relative "casilla"
require_relative "jugador"
require_relative "dado"
require "singleton"

module ModeloQytetet
  class Qytetet
    include Singleton
    attr_reader :mazo, :cartaActual, :jugadorActual, :jugadores, :tablero, :metodosalircarcel, :dado
    
    def initialize
        @@max_jugadores = 4
        @@num_sorpresas = 10
        @@num_casillas = 20
        @@precio_libertad = 200
        @@saldo_salida = 1000
        @dado = Dado.instance
        @estado = nil
        @cartaActual = nil
        @metodosalircarcel = nil
    end
    
    def self.getMaxJugadores
      @@max_jugadores
    end
    
    def actuarSiEnCasillaEdificable
      deboPagar = @jugadorActual.deboPagarAlquiler
      
      if deboPagar
        @jugadorActual.pagarAlquiler
        
        if @jugadorActual.saldo <= 0
          @estado = EstadoJuego::ALGUNJUGADORENBANCAROTA
        end
      end
      
      casilla = @jugadorActual.casillaActual
      
      tengoPropietario = casilla.tengoPropietario
      
      if @estado != EstadoJuego::ALGUNJUGADORENBANCAROTA
        if tengoPropietario
          @estado = EstadoJuego::JA_PUEDEGESTIONAR
        else
          @estado = EstadoJuego::JA_PUEDECOMPRARGESTIONAR
        end
      end
    end
    
    def actuarSiEnCasillaNoEdificable
      @estado = EstadoJuego::JA_PUEDEGESTIONAR
      
      casillaActual = @jugadorActual.casillaActual
      
      if casillaActual.tipo == TipoCasilla::IMPUESTO
        @jugadorActual.pagarImpuesto
      
      elsif casillaActual.tipo == TipoCasilla::JUEZ
        self.encarcelarJugador
        
      elsif casillaActual.tipo == TipoCasilla::SORPRESA
        @cartaActual = nil
        @estado = EstadoJuego::JA_CONSORPRESA
      end
    end
    
    def aplicarSorpresa
      @estado = EstadoJuego::PUEDOGESTIONAR
      
      if @cartaActual.tipo == TipoSorpresa::SALIRCARCEL
        @jugadorActual.setCartaLibertad(@cartaActual)
        
      elsif @cartaActual.tipo == TipoSorpresa::PAGARCOBRAR
        @jugadorActual.modificarSaldo(@cartaActual.valor)
        if @jugadorActual.saldo < 0
          @estado = EstadoJuego::ALGUNJUGADORENBANCAROTA
        end
        
      elsif @cartaActual.tipo == TipoSorpresa::IRACASILLA
        valor = @cartaActual.valor
        casillaCarcel = @tablero.esCasillaCarcel(valor)
        if casillaCarcel
          self.encarcelarJugador
        else
          self.mover(valor)
        end
        
      elsif @cartaActual.tipo == TipoSorpresa::PORCASAHOTEL
        cantidad = @cartaActual.valor
        numeroTotal = @jugadorActual.cuantasCasasHotelesTengo
        @jugadorActual.modificarSaldo(cantidad*numeroTotal)
        
        if @jugadorActual.saldo < 0
          @estado = EstadoJuego::ALGUNJUGADORENBANCAROTA
        end
        
      elsif @cartaActual.tipo == TipoSorpresa::PORJUGADOR
        for i in 0...@jugadores.size
          jugador = @jugadores[i]
          
          if jugador != @jugadorActual
            jugador.modificarSaldo(@cartaActual.valor)
            if jugador.saldo < 0
              @estado = EstadoJuego::ALGUNJUGADORENBANCAROTA
            end
            
            @jugadorActual.modificarSaldo(-@cartaActual.valor)
            
            if @jugadorActual.saldo < 0
              @estado = EstadoJuego::ALGUNJUGADORENBANCAROTA
            end
          end
        end
      end
    end
    
    def cancelarHipoteca(numeroCasilla)
      raise NotImplementedError
    end
    
    def comprarTituloPropiedad
      comprado = @jugadorActual.comprarTituloPropiedad
      
      if comprado
        @estado = EstadoJuego::JA_PUEDEGESTIONAR
      end
      
      comprado
    end
    
    def edificarCasa(numeroCasilla)
      casilla = @tablero.obtenerCasillaNumero(numeroCasilla)
      titulo = casilla.titulo
      edificada = @jugadorActual.edificarCasa(titulo)
      
      if edificada
        @estado = EstadoJuego::JA_PUEDEGESTIONAR
      end
      
      edificada
    end
    
    def edifarHotel(numeroCasilla)
      raise NotImplementedError
    end
    
    def encarcelarJugador
      unless @jugadorActual.tengoCartaLibertad
        casillaCarcel = @tablero.carcel
        @jugadorActual.irACarcel(casillaCarcel)
        @estado = EstadoJuego::JA_ENCARCELADO
      else
        carta = @jugadorActual.devolverCartaLibertad
        @mazo << carta
        @estado = EstadoJuego::JA_PUEDEGESTIONAR
      end  
    end
    
    def getValorDado
       raise NotImplementedError
    end
    
    def hipotecarPropiedad(numeroCasilla)
      raise NotImplementedError
    end
    
    def inicializarCartasSorpresa
      @tablero = Tablero.new
      @mazo = Array.new
      @mazo << Sorpresa.new("El banco se ha equivocado en algunas cuentas y te devuelven dinero. Es que no estudian...", 250, TipoSorpresa::PAGARCOBRAR)
      @mazo << Sorpresa.new("Te han pillado tus cuentas en el extrangero.", -250, TipoSorpresa::PAGARCOBRAR)
      @mazo << Sorpresa.new("Tomas el metro llegas a la casilla 17.", 17, TipoSorpresa::IRACASILLA)
      @mazo << Sorpresa.new("Te hemos pillado transportando nesquik y Cola-Cao a la misma vez.", @tablero.carcel.numeroCasilla, TipoSorpresa::IRACASILLA)
      @mazo << Sorpresa.new("El 7 dicen que da suerte. Vamos a comprobarlo mandándote a esa casilla.", 7, TipoSorpresa::IRACASILLA)
      @mazo << Sorpresa.new("Pagar por el mantenimiento de tus propiedades.", -25, TipoSorpresa::PORCASAHOTEL)
      @mazo << Sorpresa.new("Tus edificios son muy bonitos. Recibes un premio de arquitectura.", 25, TipoSorpresa::PORCASAHOTEL)
      @mazo << Sorpresa.new("Los demás se enteran de que tienes cuentas en el extrangero. Mejor sobornarlos para que no hablen, ¿no?", -200, TipoSorpresa::PORJUGADOR)
      @mazo << Sorpresa.new("Parece ser que es tu cumpleaños o tal vez los estés engañando, maldito mentiroso, recibes dinero de los demás como regalo.", 200, TipoSorpresa::PORJUGADOR)
      @mazo << Sorpresa.new("Tienes contactos en el gobierno que logran sacarte de la cárcel.", 0, TipoSorpresa::SALIRCARCEL)    
    end
    
    def inicializarJuego(nombres)
      inicializarJugadores(nombres)
      inicializarTablero
      inicializarCartasSorpresa
    end
    
    def inicializarJugadores(nombres)
      @jugadores = Array.new
      for i in 0...nombres.size
        @jugadores << Jugador.new(nombres[i])
      end
    end
    
    def inicializarTablero
      @tablero = Tablero.new
    end
    
    def intentarSalirCarcel(metodo)
      if metodo == MetodoSalirCarcel::TIRANDODADO
        resultado = self.tirarDado
        if resultado >= 5
          @jugadorActual.encarcelado = false
        end
        
      elsif metodo == MetodoSalirCarcel::PAGANDOLIBERTAD
        @jugadorActual.pagarLibertad(@@precio_libertad)
      end
      
      libre = @jugadorActual.encarcelado
      
      if libre
        @estado = EstadoJuego::JA_ENCARCELADO
      else
        @estado = EstadoJuego::JA_PREPARADO
      end
      
      libre
    end
    
    def jugar
      raise NotImplementedError
    end
    
    def mover(numCasillaDestino)
      casillaInicial = @jugadorActual.casillaActual
      casillaFinal = @tablero.obtenerCasillaNumero(numCasillaDestino)
      @jugadorActual.casillaActual = casillaFinal
      
      if numCasillaDestino < casillaInicial.numeroCasilla
        @jugadorActual.modificarSaldo(@@saldo_salida)        
      end
      
      if casillaFinal.soyEdificable
        self.actuarSiEnCasillaEdificable
      
      else
        self.actuarSiEnCasillaNoEdificable
      end
    end
    
    def obtenerCasillaJugadorActual()
      raise NotImplementedError
    end
    
    def obtenerCasillasTablero
      raise NotImplementedError
    end
    
    def obtenerPropiedadesJugador
      raise NotImplementedError
    end
    
    def obtenerPropiedadesJugadorSegunEstadoHipoteca(estadoHipoteca)
      raise NotImplementedError
    end
    
    def obtenerRanking
      raise NotImplementedError
    end
    
    def obtenerSaldoJugadorActual
      raise NotImplementedError
    end
    
    def salidaJugadores
      raise NotImplementedError
    end
    
    def setCartaActual(cartaActual)
      raise NotImplementedError
    end
    
    def siguienteJugador
      raise NotImplementedError
    end
    
    def tirarDado
      raise NotImplementedError
    end
    
    def venderPropiedad(numeroCasilla)
      raise NotImplementedError
    end
    
    private :encarcelarJugador, :inicializarCartasSorpresa, :inicializarJugadores, :inicializarTablero, :salidaJugadores, :setCartaActual
  end
end