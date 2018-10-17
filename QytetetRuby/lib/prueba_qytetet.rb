#encoding: utf-8
require_relative "Qytetet"
require_relative "tablero"
require_relative "TipoSorpresa"
module ModeloQytetet
  class PruebaQytetet
    @@juego = Qytetet.instance

    def initialize
    end
    
    def self.main
      nombres = getNombreJugadores
      @@juego.inicializarJuego(nombres)
      
      puts "ValorMayorQueCero #{ValorMayorQueCero().join(",")} "
      puts "CartasIrA #{CartasIrA().join(",")}"
      puts "Cartas SalirCarcel #{FiltrarTipo(TipoSorpresa::SALIRCARCEL).join(",")}"
      
      puts @@juego.tablero
      
      puts @@juego.jugadores
    end
    
    def self.getNombreJugadores
      nombres = Array.new
      for i in 0...Qytetet.getMaxJugadores
        puts "Escribe el nombre del jugador #{i}: "
        cadena = gets
        nombres << cadena
      end
      nombres
    end
   
    def self.ValorMayorQueCero
      temporal = Array.new
      
      for i in 0...@@juego.mazo.size
        if @@juego.mazo[i].valor > 0
          temporal << @@juego.mazo[i]
        end
      end
      return temporal
    end
    
    def self.CartasIrA
      temporal = Array.new
      for i in 0...@@juego.mazo.size
        if @@juego.mazo[i].tipo == TipoSorpresa::IRACASILLA
          temporal << @@juego.mazo[i]
        end
      end
      return temporal
    end
    
    def self.FiltrarTipo(tipo)
      temporal = Array.new
      for i in 0...@@juego.mazo.size
        if @@juego.mazo[i].tipo == tipo
          temporal << @@juego.mazo[i]
        end
      end
      return temporal
    end

    
    
  end
  PruebaQytetet.main
  
end
