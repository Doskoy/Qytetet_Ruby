#encoding: utf-8
require_relative "jugador"
module ModeloQytetet
  class TituloPropiedad
    attr_reader :nombre, :precioCompra, :alquilerBase, :factorRevalorizacion, :hipotecaBase, :precioEdificar, :numHoteles, :numCasas, :propietario
    attr_accessor :hipotecada
    attr_writer :propietario
      def initialize(nombre, precioCompra, precioEdificar, factorRevalorizacion, alquilerBase, hipotecaBase)
        @hipotecada = false
        @numHoteles = 0
        @numCasas = 0
        @nombre = nombre
        @propietario = ""
        
        if precioCompra >= 500 && precioCompra <= 1000
          @precioCompra = precioCompra
        else
          puts "Precio de compra no válido(debe estar entre 500 y 1000), lo establecemos a 500."
          @precioCompra = 500
        end
        
        if precioEdificar >= 250 && precioEdificar <= 750
          @precioEdificar = precioEdificar
        else
          puts "Precio de edificación no válido (debe estar entre 250 y 750), lo establecemos a 250."
          @precioEdificar = 250
        end
        
        if factorRevalorizacion >= 10 && factorRevalorizacion <= 20
          @factorRevalorizacion = precioEdificar
        elsif factorRevalorizacion >= -20 && factorRevalorizacion <= -10
          @factorRevalorizacion = precioEdificar
        else
          puts "Factor de revalorización no válido (debe estar entre 10 y 20 o -10 y -20), lo establecemos a 10."
          @factorRevalorizacion = 10
        end
        
        if alquilerBase >= 50 && alquilerBase <= 100
          @alquilerBase = alquilerBase
        else
          puts "Precio base de alquiler no válido (debe estar entre 50 y 100), lo establecemos a 50."
          @alquilerBase = 50
        end
        
        if hipotecaBase >= 150 && hipotecaBase <= 1000
          @hipotecaBase = hipotecaBase
        else
          puts "Precio base de hipoteca no válido (debe estar entre 150 y 1000), lo establecemos a 150."
          @alquilerBase = 150
        end
      end
      
      def calcularCosteCancelar() 
        raise NotImplementedError
      end
      
      def calcularCosteHipotecar()
        raise NotImplementedError
      end
      
      def calcularImporteAlquiler
        costeAlquiler = @alquilerBase + (@numCasas * 0.5 + @numHoteles * 2).to_i
        
        costeAlquiler
      end
      
      def calcularPrecioVenta()
        raise NotImplementedError
      end
      
      def cancelarHipoteca
        raise NotImplementedError
      end
      
      def cobrarAlquiler(coste)
        raise NotImplementedError
      end
      
      def edificarCasa()
        @numCasas = @numCasas + 1
      end
      
      def edificarHotel()
        raise NotImplementedError
      end
      
      def getPropietario()
        raise NotImplementedError
      end
      
      def hipotecar()
        raise NotImplementedError
      end
      
      def pagarAlquiler()
        costeAlquiler = self.calcularCosteAlquiler
        @propietario.modificarSaldo(costeAlquiler)
        
        costeAlquiler
      end
      
      def propietarioEncarcelado()
        raise NotImplementedError
      end
      
      def setPropietario(propietario)  
        raise NotImplementedError
      end
      
      def tengoPropietario()
        raise NotImplementedError
      end
      
      def to_s
        texto = "Nombre propiedad: #{@nombre}\nPropietario: #{@propietario}\nHipotecada: "
        
        if@hipotecada == true
          texto << "Sí"
        else
          texto << "No"
        end
        texto << "\nPrecio de compra: #{@precioCompra}\nAlquiler base: #{@alquilerBase}\nFactor de revalorización: #{@factorRevalorizacion}\nHipoteca base: #{@hipotecaBase}\nPrecio de edificar: #{@precioEdificar}\nNúmero de hoteles/casas: #{@numHoteles}/#{@numCasas}"
        texto
      end
      
  end
end
