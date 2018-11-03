#encoding: utf-8
require_relative "titulo_propiedad"

module ModeloQytetet
  class Casilla
    attr_reader :numeroCasilla, :coste, :tipo
    attr_accessor :titulo
    def initialize(tipo, coste, numeroCasilla, titulo)
      @tipo = tipo
      @coste = coste
      @numeroCasilla = numeroCasilla
      @titulo = titulo
    end
    
    def self.newCalle(numeroCasilla, titulo)
      new(TipoCasilla::CALLE, titulo.precioCompra, numeroCasilla, titulo)
    end
    
    def self.newImpuesto(numeroCasilla, coste)
      new(TipoCasilla::IMPUESTO, coste, numeroCasilla, nil)
    end
    
    def self.newSorpresa(numeroCasilla)
      new(TipoCasilla::SORPRESA, 0, numeroCasilla, nil)
    end
    
    def self.newSalida(numeroCasilla)
      new(TipoCasilla::SALIDA, 1000, numeroCasilla, nil)
    end
    
    def self.newJuez(numeroCasilla)
      new(TipoCasilla::JUEZ, 0, numeroCasilla, nil)
    end
    
    def self.newParking(numeroCasilla)
      new(TipoCasilla::PARKING, 0, numeroCasilla, nil)
    end
    
    def self.newCarcel(numeroCasilla)
      new(TipoCasilla::CARCEL, 0, numeroCasilla, nil)
    end
    
    private_class_method :new
    
    def set_titulo(titulo)
      @titulo = titulo
    end
    
    def asignarPropietario(jugador)
      raise NotImplementedError
    end
    
    def pagarAlquiler
      costeAlquiler = @titulo.pagarAlquiler
      
      costeAlquiler
    end
    
    def propietarioEncarcelado
      raise NotImplementedError
    end
    
    def soyEdificable
      raise NotImplementedError
    end
    
    def tengoPropietario
      raise NotImplementedError
    end
    
    def to_s
      texto = "Estás en la casilla: #{@numeroCasilla}\nCoste de la casilla: #{@coste}\nTipo de casilla: #{@tipo}\nTítulo: "
      
      unless @titulo == nil
        texto << "\n#{@titulo}"
      else
        texto << "No tiene"
        
      texto
      end
    end
  end
end