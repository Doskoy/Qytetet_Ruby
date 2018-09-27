#encoding: utf-8
require_relative "Qytetet"
module ModeloQytetet
  class PruebaQytetet
    @@juego = Qytetet.new
    def main
      puts "ValorMayorQueCero #{ValorMayorQueCero().join(",")} "
      #puts "CartasIrA #{CartasIrA()}"
      #puts "Cartas SalirCarcel #{FiltrarTipo(TipoSorpresa::SALIRCARCEL)}"
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
  
  #Hola
  x = PruebaQytetet.new
  x.main
  
end
