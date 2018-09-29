#encoding: utf-8

module ModeloQytetet
  class Casilla
    attr_reader :numeroCasilla, :coste, :tipo, :titulo
    def initialize(tipo, coste, numeroCasilla, precioEdificar, factorRevalorizacion, alquilerBase, hipotecaBase)
      @tipo = tipo
      if tipo==TipoCasilla::CALLE
        constructor_calle(coste, numeroCasilla, precioEdificar, factorRevalorizacion, alquilerBase, hipotecaBase)
      else
        constructor_nocalle(numeroCasilla)
      end
    end
    
    private
    def constructor_calle(coste, numeroCasilla, precioEdificar, factorRevalorizacion, alquilerBase, hipotecaBase)
      @titulo = TituloPropiedad.new(coste, precioEdificar, factorRevalorizacion, alquilerBase, hipotecaBase)
      @coste = @titulo.precioCompra
      @numeroCasilla = numeroCasilla
    end
    
    def constructor_nocalle(numeroCasilla)
      @titulo = 0
      @coste = 0
      @numeroCasilla = numeroCasilla
    end
    
    public
    def set_titulo(coste, precioEdificar, factorRevalorizacion, alquilerBase, hipotecaBase)
      @titulo = TituloPropiedad.new(coste, precioEdificar, factorRevalorizacion, alquilerBase, hipotecaBase)
    end
    
    def to_s
      texto = "Estás en la casilla: #{@numeroCasilla}\nCoste de la casilla: #{@coste}\nTipo de casilla: #{@tipo}\nTítulo: "
      unless @titulo == 0
        texto << "\n#{@titulo}"
      else
        texto << "No tiene"
      end
    end
  end
end
