#encoding: utf-8

module ModeloQytetet
  class Casilla
    attr_reader :numeroCasilla, :coste, :tipo, :titulo
    def initialize(tipo, numeroCasilla,titulo=0)
      @tipo = tipo
      @numeroCasilla = numeroCasilla
      if tipo==TipoCasilla::CALLE
        constructor_calle(titulo)
      else
        constructor_nocalle
      end
    end
    
    private
    def constructor_calle(titulo)
      @titulo = titulo
      @coste = @titulo.precioCompra
    end
    
    def constructor_nocalle
      @titulo = 0
      @coste = 0
    end
    
    public
    def set_titulo(titulo)
      @titulo = titulo
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
