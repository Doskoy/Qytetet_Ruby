# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Jugador
  
  attr_reader :cartaLibertad, :casillaActual, :encarcelado, :nombre, :propiedades, :saldo
  attr_accesor :cartaLibertad, :casillaActual, :encarcelado
  
  def initialize
    @encarcelado = false;
    @nombre = "";
    @saldo = 7500;
  end
  
  def cancelarHipoteca(titulo)
    raise NotImplementedError
  end
  
  def comprarTituloPropiedad()
    raise NotImplementedError
  end
  
  def cuantasCasasHotelesTengo()
    raise NotImplementedError
  end
  
  def deboPagarAlquiler()
    raise NotImplementedError
  end
  
  def devolverCartaLibertad()
    raise NotImplementedError
  end
  
  def edificarCasa()
    raise NotImplementedError
  end
  
  def edificarHotel()
    raise NotImplementedError
  end
  
  def eliminarDeMisPropiedades(titulo)
    raise NotImplementedError
  end
  
  def esDeMiPropiedad(titulo) 
    raise NotImplementedError
  end
  
  def estoyEnCalleLibre()
    raise NotImplementedError
  end
  
  def hipotecarPropiedad(titulo)
    raise NotImplementedError
  end
  
  def irACarcel(casilla)
    raise NotImplementedError
  end
  
  def modificarSaldo(cantidad)
    raise NotImplementedError
  end
  
  def obtenerCapital()
    raise NotImplementedError
  end
  
  def obtenerPropiedades(hipotecada) 
    raise NotImplementedError
  end
  
  def pagarAlquiler()
    raise NotImplementedError
  end

  def pagarImpuesto()
    raise NotImplementedError
  end
  
  def pagarLibertad(cantidad)
    raise NotImplementedError
  end
  
  def tengoCartaLibertad()
    raise NotImplementedError
  end
  
  def tengoSaldo(cantidad)
    raise NotImplementedError
  end
  
  def venderPropiedad(casilla)
    raise NotImplementedError
  end
  
  def to_s
      texto = "Nombre: #{@nombre}\nSaldo: #{@saldo}\nEncarcelado: #{@encarcelado}\n"
      return texto
  end
end
