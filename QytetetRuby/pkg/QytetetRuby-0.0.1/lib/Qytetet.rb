#encoding: utf-8
require_relative "Sorpresa"
require_relative "TipoSorpresa"

module ModeloQytetet
  class Qytetet
    attr_reader :mazo
    
    def inicializarCartasSorpresa
      @mazo = Array.new
      @mazo << Sorpresa.new("El banco se ha equivocado en algunas cuentas y te devuelven dinero. Es que no estudian...", 250, TipoSorpresa::PAGARCOBRAR)
      @mazo << Sorpresa.new("Te han pillado tus cuentas en el extrangero.", -250, TipoSorpresa::PAGARCOBRAR)
      @mazo << Sorpresa.new("Tomas el tren que aún no ha llegado a Granada y llegas a la casilla 17.", 17, TipoSorpresa::IRACASILLA)
      @mazo << Sorpresa.new("Te hemos pillado transportando nesquik y Cola-Cao a la misma vez.", 9, TipoSorpresa::IRACASILLA)
      @mazo << Sorpresa.new("El 7 dicen que da suerte. Vamos a comprobarlo mandándote a esa casilla.", 7, TipoSorpresa::IRACASILLA)
      @mazo << Sorpresa.new("Pagar por el mantenimiento de tus propiedades.", -25, TipoSorpresa::PORCASAHOTEL)
      @mazo << Sorpresa.new("Tus edificios son muy bonitos. Recibes un premio de arquitectura.", 25, TipoSorpresa::PORCASAHOTEL)
      @mazo << Sorpresa.new("Los demás se enteran de que tienes cuentas en el extrangero. Mejor sobornarlos para que no hablen, ¿no?", -200, TipoSorpresa::PORJUGADOR)
      @mazo << Sorpresa.new("Parece ser que es tu cumpleaños o tal vez los estés engañando, maldito mentiroso, recibes dinero de los demás como regalo.", 200, TipoSorpresa::PORJUGADOR)
      @mazo << Sorpresa.new("Tienes contactos en el gobierno que logran sacarte de la cárcel.", 0, TipoSorpresa::SALIRCARCEL)    
    end
  end
end
