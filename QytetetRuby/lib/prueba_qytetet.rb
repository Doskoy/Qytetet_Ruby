#encoding: utf-8
require_relative "Qytetet"
require_relative "tablero"
module ModeloQytetet
  class PruebaQytetet
    @@juego = Qytetet.new
    attr_accessor :tablero
    def initialize
      @tablero = Tablero.new
    end
    
    def main
      #puts "ValorMayorQueCero #{ValorMayorQueCero().join(",")} "
      #puts "CartasIrA #{CartasIrA().join(",")}"
      #puts "Cartas SalirCarcel #{FiltrarTipo(TipoSorpresa::SALIRCARCEL).join(",")}"
      
      puts @tablero
    end
   
    def ValorMayorQueCero
      @@juego.inicializarCartasSorpresa
      temporal = Array.new
      
      for i in 0...@@juego.mazo.size
        if @@juego.mazo[i].valor > 0
          temporal << @@juego.mazo[i]
        end
      end
      return temporal
    end
    
    def CartasIrA
      temporal = Array.new
      for i in 0...@@juego.mazo.size
        if @@juego.mazo[i].tipo == TipoSorpresa::IRACASILLA
          temporal << @@juego.mazo[i]
        end
      end
      return temporal
    end
    
    def FiltrarTipo(tipo)
      temporal = Array.new
      for i in 0...@@juego.mazo.size
        if @@juego.mazo[i].tipo == tipo
          temporal << @@juego.mazo[i]
        end
      end
      return temporal
    end

    
    
  end
  x = PruebaQytetet.new
  x.main
  
end
