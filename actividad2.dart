abstract class Animal {}

abstract class Mamifero extends Animal {}

abstract class Ave extends Animal {}

abstract class Pez extends Animal {}

mixin Volar {
  void volar() => print('estoy volando');
}

mixin Caminar {
  void caminar() => print('estoy caminando');
}

mixin Nadar {
  void nadar() => print('estoy nadando');
}

// Mamíferos
class Delfin extends Mamifero with Nadar {}

class Murcielago extends Mamifero with Caminar, Volar {}

class Gato extends Mamifero with Caminar {}

// Aves
class Pato extends Ave with Caminar, Volar, Nadar {}

class Paloma extends Ave with Caminar, Volar {}

// Peces
class Tiburon extends Pez with Nadar {}

class PezVolador extends Pez with Nadar, Volar {}

void main() {

  final flipper = Delfin();
  flipper.nadar();

  final pato = Pato();
  pato.caminar();
  pato.volar();
  pato.nadar();

  final perro = Perro();
  perro.caminar();
  perro.nadar();

  final aguila = Aguila();
  aguila.caminar();
  aguilavolar();

  final cocodrilo = Cocodrilo();
  cocodrilo.caminar();
  cocodrilo.nadar();

  final pelicano = Pelicano();
  pelicano.nadar();
  pelicano.caminar();
  pelicano.volar();
  
  final rana = Rana();
  rana.caminar();
  rana.nadar();
}
