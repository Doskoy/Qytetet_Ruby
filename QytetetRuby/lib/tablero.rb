#encoding: utf-8
require_relative "TituloPropiedad"
require_relative "TipoCasilla"
require_relative "Casilla"
module ModeloQytetet
  class Tablero
    attr_reader :casillas, :carcel
    def initialize
      inicializar
    end
    
    private
    def inicializar
      @casillas = Array.new
      @casillas << Casilla.new(TipoCasilla::SALIDA, 0)
      titulo = TituloPropiedad.new("Avenida de Andalucía", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 1, titulo)
      titulo = TituloPropiedad.new("Avenida de la Constitución", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 2, titulo)
      @casillas << Casilla.new(TipoCasilla::SORPRESA, 3)
      titulo = TituloPropiedad.new("Parque Almunia", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 4, titulo)
      @casillas << Casilla.new(TipoCasilla::CARCEL, 5)
      titulo = TituloPropiedad.new("Gran Vía de Colón", 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 6, titulo)
      @casillas << Casilla.new(TipoCasilla::SORPRESA, 7)
      titulo = TituloPropiedad.new("Avenida de Dilar", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 8, titulo)
      titulo = TituloPropiedad.new("Camino de Ronda", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 9, titulo)
      @casillas << Casilla.new(TipoCasilla::PARKING, 10)
      titulo = TituloPropiedad.new("Recogidas", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 11, titulo)
      titulo = TituloPropiedad.new("Avenida de Juan Pablo II", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 12, titulo)
      @casillas << Casilla.new(TipoCasilla::SORPRESA, 13)
      titulo = TituloPropiedad.new("Plaza de Bib-Rambla", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 14, titulo)
      @casillas << Casilla.new(TipoCasilla::JUEZ, 15)
      titulo = TituloPropiedad.new("Calle Mesones", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 16, titulo)
      titulo = TituloPropiedad.new("Jardines del Triunfo", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 17, titulo)
      titulo = TituloPropiedad.new("Calle Acera del Darro", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::IMPUESTO, 18, titulo)
      titulo = TituloPropiedad.new("Parque Almunia", 800, 500, 10, 60, 200)
      @casillas << Casilla.new(TipoCasilla::CALLE, 19)
      
      @carcel = casillas[5]
    end
  end
end
