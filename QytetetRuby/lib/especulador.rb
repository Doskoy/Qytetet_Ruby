#encoding: utf-8
module ModeloQytetet
  class Jugador
    
  end
  class Especulador < Jugador
    attr_reader :fianza
    
    def self.copia(unJugador, fianza)
      @fianza = fianza
      new super(unJugador)
    end
    
    private_class_method :new
    
    def pagarImpuesto(cantidad)
      super.pagarImpuesto(-cantidad/2)
    end
     
    def deboIrACarcel()
      deboIr = super.deboIrACarcel and !pagarFianza
      deboIr
    end
    
    def convertirme(fianza)
      return self
    end
    
    def pagarFianza
      tengo = super.tengoSaldo(@fianza);
      if(tengo)
        super.modificarSaldo(-@fianza)
      end
      return tengo
    end

    def puedoEdificarCasa(titulo)
      numCasas = titulo.numCasas
      return numCasas < 8
    end
    
    def puedoEdificarHotel(titulo)
      numHoteles = titulo.numHoteles
      numCasas = titulo.numCasas
      return (numHoteles < 8 and numCasas >= 4)
    end
    
    def to_s
      super.to_s
    end
  end
  
end