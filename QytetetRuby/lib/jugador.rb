#encoding: utf-8
require_relative "casilla"
require_relative "tablero"
module ModeloQytetet
  class Jugador
  
    attr_reader :nombre, :propiedades, :saldo, :cartaLibertad
    attr_accessor :casillaActual, :encarcelado
  
    def initialize(nombre)
      @encarcelado = false;
      @nombre = nombre;
      @saldo = 7500;
      @cartaLibertad = nil;
      @casillaActual = nil;
      @propiedades = Array.new
    end
    
    def setCartaLibertad(cartaLibertad)
      if cartaLibertad.tipo == TipoSorpresa::SALIRCARCEL
        @cartaLibertad = cartaLibertad
      end
    end
  
    def cancelarHipoteca(titulo)
      raise NotImplementedError
    end
  
    def comprarTituloPropiedad
      comprado = false
      costeCompra = @casillaActual.coste
      
      if costeCompra < @saldo
        comprado = true
        @casillaActual.titulo.propietario = self
        @propiedades << @casillaActual.titulo
        self.modificarSaldo(-costeCompra)
      end
      
      comprado
    end
  
    def cuantasCasasHotelesTengo
      raise NotImplementedError
    end
  
    def deboPagarAlquiler
      raise NotImplementedError
    end
  
    def devolverCartaLibertad()
      raise NotImplementedError
    end
  
    def edificarCasa(titulo)
      edificada = false
      
      numCasas = titulo.numCasas
      
      if numCasas < 4
        costeEdificarCasa = titulo.precioEdificar
        tengoSaldo = self.tengoSaldo(costeEdificarCasa)
        
        if(tengoSaldo)
          titulo.edificarCasa
          self.modificarSaldo(-costeEdificarCasa)
          edificada = true
        end
      end
      
      edificada
    end
  
    def edificarHotel()
      raise NotImplementedError
    end
  
    def eliminarDeMisPropiedades(titulo)
      raise NotImplementedError
    end
  
    def esDeMiPropiedad(titulo) 
      raise NotImplementedError
    end
  
    def estoyEnCalleLibre()
      raise NotImplementedError
    end
  
    def hipotecarPropiedad(titulo)
      raise NotImplementedError
    end
  
    def irACarcel(casilla)
      @casillaActual = casilla
      @encarcelado = true
    end
  
    def modificarSaldo(cantidad)
      raise NotImplementedError
    end
  
    def obtenerCapital()
      raise NotImplementedError
    end
  
    def obtenerPropiedades(hipotecada) 
      raise NotImplementedError
   end
  
    def pagarAlquiler()
      raise NotImplementedError
    end

    def pagarImpuesto()
      raise NotImplementedError
    end
  
    def pagarLibertad(cantidad)
      raise NotImplementedError
    end
  
    def tengoCartaLibertad()
      raise NotImplementedError
    end
  
    def tengoSaldo(cantidad)
      raise NotImplementedError
    end
  
    def venderPropiedad(casilla)
      raise NotImplementedError
    end
  
    def to_s
      texto = "\nNombre: #{@nombre}\nSaldo: #{@saldo}\nEncarcelado: #{@encarcelado}\nEstá en la casilla: #{@casillaActual}\nCarta liberad: #{@cartaLibertad}\nPropiedades: \n"
      
      for i in 0...@propiedades.size
        texto += "#{@propiedades[i]}\n"
      end
      return texto
    end
  end
end
