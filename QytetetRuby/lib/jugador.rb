#encoding: utf-8
require_relative "casilla"
require_relative "tablero"
module ModeloQytetet
  class Jugador
  
    attr_reader :nombre, :propiedades, :saldo
    attr_accessor :cartaLibertad, :casillaActual, :encarcelado
  
    def initialize(nombre)
      @encarcelado = false;
      @nombre = nombre;
      @saldo = 7500;
      @cartaLibertad = nil;
      @casillaActual = nil;
      @propiedades = Array.new
    end
  
    def cancelarHipoteca(titulo)
      raise NotImplementedError
    end
  
    def comprarTituloPropiedad()
      raise NotImplementedError
    end
  
    def cuantasCasasHotelesTengo()
      raise NotImplementedError
    end
  
    def deboPagarAlquiler()
      raise NotImplementedError
    end
  
    def devolverCartaLibertad()
      raise NotImplementedError
    end
  
    def edificarCasa()
      raise NotImplementedError
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
      raise NotImplementedError
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
      texto = "Nombre: #{@nombre}\nSaldo: #{@saldo}\nEncarcelado: #{@encarcelado}\nEstá en la casilla: #{@casillaActual}\nCarta liberad: #{@cartaLibertad}\nPropiedades: \n"
      
      for i in 0...@propiedades.size
        texto += "#{@propiedades[i]}\n"
      end
      return texto
    end
  end
end
