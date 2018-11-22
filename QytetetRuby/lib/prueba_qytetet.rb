#encoding: utf-8
require_relative "Qytetet"
require_relative "tablero"
require_relative "TipoSorpresa"
require_relative "metodo_salir_carcel"
module ModeloQytetet
  class PruebaQytetet
    @@juego = Qytetet.instance

    def initialize
    end
    
    def self.main
      nombres = getNombreJugadores
      @@juego.inicializarJuego(nombres)
      puts"---------------------------------------------------------"
      movimiento = @@juego.tirarDado
      @@juego.mover(1)
      @@juego.comprarTituloPropiedad
      puts @@juego.jugadorActual
      puts "Compro Casa---------------------------------------------"
      @@juego.edificarCasa(1)
      @@juego.edificarCasa(1)
      @@juego.edificarCasa(1)
      @@juego.edificarCasa(1)
      puts @@juego.jugadorActual
      puts "Compro hotel---------------------------------------------"
      @@juego.edificarHotel(1)
      puts @@juego.jugadorActual
      @@juego.siguienteJugador
      @@juego.mover(1)
      puts "Pum! Sablazo-----------------------------------------------"
      puts @@juego.jugadorActual.saldo
      puts "Im rich --------------------------------------------------"
      @@juego.siguienteJugador
      puts @@juego.jugadorActual.saldo
      @@juego.obtenerRanking
      puts @@juego.jugadores
    end
    
    def self.getNombreJugadores
      nombres = Array.new
      n = 0
      
      puts "Introduzca número de jugadores: "
      n=gets.chomp.to_i
      
      if n <= Qytetet.getMaxJugadores and n >= 2
        for i in 0...n
          puts "Escribe el nombre del jugador #{i}: "
          cadena = gets
          nombres << cadena
        end
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