#encoding: utf-8
require_relative "Sorpresa"
require_relative "TipoSorpresa"
require_relative "tablero"
require_relative "casilla"
require_relative "jugador"
require "singleton"

module ModeloQytetet
  class Qytetet
    include Singleton
    attr_reader :mazo, :max_jugadores, :num_sorpresas, :num_casillas, :precio_libertad, :saldo_salida, :cartaActual, :dado, :jugadorActual, :jugadores, :tablero, :metodosalircarcel
    
    def initialize
        @max_jugadores = 4
        @num_sorpresas = 10
        @num_casillas = 20
        @precio_libertad = 200
        @saldo_salida = 1000
    end
    
    def actuarSiEnCasillaEdificable
      raise NotImplementedError
    end
    
    def actuarSiEnCasillaNoEdificable
      raise NotImplementedError
    end
    
    def aplicarSorpresa
      raise NotImplementedError
    end
    
    def cancelarHipoteca(numeroCasilla)
      raise NotImplementedError
    end
    
    def comprarTituloPropiedad
      raise NotImplementedError
    end
    
    def edificarCasa(numeroCasilla)
      raise NotImplementedError
    end
    
    def edifarHotel(numeroCasilla)
      raise NotImplementedError
    end
    
    def encarcelarJugador
      raise NotImplementedError
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
      @mazo << Sorpresa.new("Te hemos pillado transportando nesquik y Cola-Cao a la misma vez.", tablero.carcel.numeroCasilla, TipoSorpresa::IRACASILLA)
      @mazo << Sorpresa.new("El 7 dicen que da suerte. Vamos a comprobarlo mandándote a esa casilla.", 7, TipoSorpresa::IRACASILLA)
      @mazo << Sorpresa.new("Pagar por el mantenimiento de tus propiedades.", -25, TipoSorpresa::PORCASAHOTEL)
      @mazo << Sorpresa.new("Tus edificios son muy bonitos. Recibes un premio de arquitectura.", 25, TipoSorpresa::PORCASAHOTEL)
      @mazo << Sorpresa.new("Los demás se enteran de que tienes cuentas en el extrangero. Mejor sobornarlos para que no hablen, ¿no?", -200, TipoSorpresa::PORJUGADOR)
      @mazo << Sorpresa.new("Parece ser que es tu cumpleaños o tal vez los estés engañando, maldito mentiroso, recibes dinero de los demás como regalo.", 200, TipoSorpresa::PORJUGADOR)
      @mazo << Sorpresa.new("Tienes contactos en el gobierno que logran sacarte de la cárcel.", 0, TipoSorpresa::SALIRCARCEL)    
    end
    
    def inicializarJuego(nombres)
      inicializarJugagadores(nombres)
      inicializarTablero
      inicializarCartasSorpresa
    end
    
    def inicializarJugadores(nombres)
      @jugadores = Array.new
      @jugadores << Jugador.new(nombres[0])
      @jugadores << Jugador.new(nombres[1])
      @jugadores << Jugador.new(nombres[2])
      @jugadores << Jugador.new(nombres[3])
    end
    
    def inicializarTablero
      @tablero = Tablero.new
    end
    
    def intentarSalirCarcel(metodo)
      raise NotImplementedError
    end
    
    def jugar
      raise NotImplementedError
    end
    
    def mover(numCasillaDestino)
      raise NotImplementedError
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
    
    def ObtenerSaldoJugadorActual
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