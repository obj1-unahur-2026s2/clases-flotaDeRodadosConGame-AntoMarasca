class ChevroletCorsa {
  method capacidad()  = 4
  method velocidadMaxima() = 150
  method peso() = 1300
  const property color 
}

class RenaultKwid {
  const conTanqueAdicional

  method capacidad() { 
    if (conTanqueAdicional) {
      return 3
    } else {
      return 4
    }
  }
  method velocidadMaxima() { 
    if (conTanqueAdicional) {
      return 120
    } else {
      return 110
    }
  }
  method peso() { 
    if (conTanqueAdicional) {
      return 1350
    } else {
      return 1200
    }
  }
  method color() = azul
}

object trafic {
  var interior = comodo
  var motor = pulenta

  method cambiarInterior(nuevoInterior) {
    interior = nuevoInterior
  }
  method cambiarMotor(nuevoMotor) {
    motor = nuevoMotor
  }

  method capacidad() = interior.capacidad()
  method velocidadMaxima() = motor.velocidadMaxima()
  method peso() = 4000 + interior.peso() + motor.peso()
  const property color = blanco
}

object comodo {
  method capacidad() = 5
  method peso() = 700
}

object popular {
  method capacidad() = 12
  method peso() = 1000
}

object pulenta {
  method peso() = 800
  method velocidadMaxima() = 130
}

object bataton {
  method peso() = 500
  method velocidadMaxima() = 80
}

class AutoEspecial {
  const property capacidad
  const property velocidadMaxima
  const property peso
  const property color 
}

class Dependencia {
  const flota = []
  var property empleados

  method agregarAFlota(rodado) {
    return flota.add(rodado)
  }
  method quitarDeFlota(rodado) {
    return flota.remove(rodado)
  }
  method pesoTotalFlota() {
    return flota.sum({f => f.peso()})
  }
  method estaBienEquipada() { 
    return (flota.size() >= 3) && (flota.all({f => f.velocidadMaxima() >= 100}))
  }
  method colorDeRodado(color) {
    return flota.map({f => f.color() == color})
  }
  method capacidadTotalEnColor(color) {
    return self.colorDeRodado(color).sum({f => f.capacidad()})
  }
  method colorDelRodadoMasRapido() {
    return flota.max({f => f.velocidadMaxima()}).color()
  }
  method capacidadDeLaFlota() {
    return flota.sum({f => f.capacidad()})
  }
  method capacidadFaltante() {
    return self.empleados() - self.capacidadDeLaFlota()
  }
  method esGrande() {
    return (self.empleados() >= 40) && (flota.size() >= 5)
  }
}

object rojo {}
object azul {}
object verde {}
object beige {}
object blanco {}