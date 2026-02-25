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

  final bat = Murcielago();
  bat.caminar();
  bat.volar();

  final kitty = Gato();
  kitty.caminar();

  final duck = Pato();
  duck.caminar();
  duck.volar();
  duck.nadar();

  final dove = Paloma();
  dove.caminar();
  dove.volar();

  final shark = Tiburon();
  shark.nadar();

  final flyingFish = PezVolador();
  flyingFish.nadar();
  flyingFish.volar();

}
