#encoding: utf-8
require_relative "TipoCasilla"
require_relative "casilla"
require_relative "titulo_propiedad"
module ModeloQytetet
  class Tablero
    attr_reader :casillas, :carcel
    def initialize
      inicializar
    end
    
    private
    def inicializar
      @casillas = Array.new
      @casillas << Casilla.newSalida(0)
      titulo = TituloPropiedad.new("Avenida de Andalucia", 800, 500, 10, 60, 200)
      @casillas << Casilla.newCalle(1, titulo)
      titulo = TituloPropiedad.new("Avenida de la Constitucion", 800, 500, 10, 60, 200)
      @casillas << Casilla.newCalle(2, titulo)
      @casillas << Casilla.newSorpresa(3)
      titulo = TituloPropiedad.new("Parque Almunia", 800, 500, 10, 60, 200)
      @casillas << Casilla.newCalle(4, titulo)
      @casillas << Casilla.newCarcel(5)
      titulo = TituloPropiedad.new("Gran Via de Colon",800 ,500, 10, 60, 200)
      @casillas << Casilla.newCalle(6, titulo)
      @casillas << Casilla.newSorpresa(7)
      titulo = TituloPropiedad.new("Avenida de Dilar", 800, 500, 10, 60, 200)
      @casillas << Casilla.newCalle(8, titulo)
      titulo = TituloPropiedad.new("Camino de Ronda", 800, 500, 10, 60, 200)
      @casillas << Casilla.newCalle(9, titulo)
      @casillas << Casilla.newParking(10)
      titulo = TituloPropiedad.new("Recogidas", 800, 500, 10, 60, 200)
      @casillas << Casilla.newCalle(11, titulo)
      titulo = TituloPropiedad.new("Avenida de Juan Pablo II", 800, 500, 10, 60, 200)
      @casillas << Casilla.newCalle(12, titulo)
      @casillas << Casilla.newSorpresa(13)
      titulo = TituloPropiedad.new("Plaza de Bib-Rambla", 800, 500, 10, 60, 200)
      @casillas << Casilla.newCalle(14, titulo)
      @casillas << Casilla.newJuez(15)
      titulo = TituloPropiedad.new("Calle Mesones", 800, 500, 10, 60, 200)
      @casillas << Casilla.newCalle(16, titulo)
      titulo = TituloPropiedad.new("Jardines del Triunfo", 800, 500, 10, 60, 200)
      @casillas << Casilla.newCalle(17, titulo)
      @casillas << Casilla.newImpuesto(18, 100)
      titulo = TituloPropiedad.new("Parque Almunia", 800, 500, 10, 60, 200)
      @casillas << Casilla.newCalle(19, titulo)
      
      @carcel = @casillas[5]
    end
    
    public
    
    def esCasillaCarcel(numeroCasilla)
      if (numeroCasilla ==  @carcel.numeroCasilla)
        return true
      else
        return false
      end
    end
    
    def obtenerCasillaFinal(casilla, desplazamiento)
      pos = casilla.numeroCasilla
      pos += desplazamiento
      pos = pos%(@casillas.size())
      return casilla[pos]
    end
    
    def obtenerCasillaNumero(numeroCasilla)
      if(numeroCasilla < 0 || numeroCasilla > @casillas.size())
        return nil
      else
        return @casillas[numeroCasilla]
      end
    end
    
    
    public
    def to_s
      texto = ""
      
      for i in 0...@casillas.size
        texto += @casillas[i].to_s + "\n-----------------------------------------------\n"
      end
      
      texto
    end
  end
end
