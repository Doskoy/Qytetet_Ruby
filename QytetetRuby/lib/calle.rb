#encoding: utf-8
require_relative "casilla"

module ModeloQytetet
  class Calle < Casilla
    attr_reader :titulo
    def initialize(numeroCasilla, titulo)
      super(TipoCasilla::CALLE, titulo.precioCompra, numeroCasilla)
      @titulo = titulo
    end
    
    def self.newCalle(numeroCasilla, titulo)
      new(numeroCasilla, titulo)
    end

    def tipo
      return TipoCasilla::CALLE
    end

    def pagarAlquiler
      costeAlquiler = @titulo.pagarAlquiler

      costeAlquiler
    end

    def soyEdificable
      edificable = false
      if(@tipo == TipoCasilla::CALLE)
        edificable = true
      end
      return edificable
    end

    def tengoPropietario
      @titulo.tengoPropietario
    end
    
    def to_s
      texto = super.to_s
      texto += "Titulo: "
      
      unless @titulo == nil
        texto << "#{@titulo}\n"
      end
        
      texto
    end
  end
end
