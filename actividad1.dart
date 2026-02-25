import 'dart:convert';

// 1. Clase Persona con atributos
class Persona {
  // Atributos
  String nombre;
  int edad;
  String ciudad;
  String profesion;

  // 2. Constructor que recibe atributos
  Persona(this.nombre, this.edad, this.ciudad, this.profesion);

  // 3. Constructor por nombre personalizado que recibe datos JSON
  Persona.fromJson(String jsonData) 
      : this._fromJsonMap(json.decode(jsonData));

  // Constructor auxiliar privado
  Persona._fromJsonMap(Map<String, dynamic> map)
      : nombre = map['nombre'] ?? 'Sin nombre',
        edad = map['edad'] ?? 0,
        ciudad = map['ciudad'] ?? 'Sin ciudad',
        profesion = map['profesion'] ?? 'Sin profesión';

  // Constructor para JSON inválido
  Persona.error()
      : nombre = 'Error en JSON',
        edad = 0,
        ciudad = 'Desconocida',
        profesion = 'Desconocida';

  // 5. Funciones tradicionales
  // Función tradicional sin parámetros
  void saludar() {
    print('Hola, soy $nombre y tengo $edad años.');
  }

  // Función tradicional con parámetros
  void presentarse(String saludo) {
    print('$saludo! Me llamo $nombre, vivo en $ciudad y soy $profesion.');
  }

  // 6. Funciones de flecha (arrow functions)
  // Función de flecha sin parámetros
  void mostrarInformacion() => 
      print('Información: $nombre - $edad años - $ciudad - $profesion');

  // Función de flecha con parámetros
  void actualizarDatos(String nuevaCiudad, String nuevaProfesion) => 
      print('Actualizando datos de $nombre: Ciudad: $ciudad → $nuevaCiudad, Profesión: $profesion → $nuevaProfesion');

  // 4. Método para mostrar todos los datos (con interpolación de strings)
  void mostrarDatos() {
    print('\n--- Datos de la Persona ---');
    print('Nombre: $nombre');
    print('Edad: $edad años');
    print('Ciudad: $ciudad');
    print('Profesión: $profesion');
    print('----------------------------\n');
  }
}

void main() {
  print('=== PRUEBAS DE LA CLASE PERSONA EN FLUTTER/DART ===\n');

  // 7. Pruebas en el main()
  
  // Prueba del constructor tradicional
  print('1. Creando persona con constructor tradicional:');
  Persona persona1 = Persona('Ana García', 28, 'Madrid', 'Ingeniera');
  persona1.mostrarDatos();

  // Prueba del constructor JSON
  print('2. Creando persona con constructor JSON:');
  String jsonData = '''
  {
    "nombre": "Carlos López",
    "edad": 35,
    "ciudad": "Barcelona",
    "profesion": "Arquitecto"
  }
  ''';
  
  try {
    Persona persona2 = Persona.fromJson(jsonData);
    persona2.mostrarDatos();

    // Prueba de funciones tradicionales
    print('3. Probando funciones tradicionales:');
    persona1.saludar();
    persona1.presentarse('Buenos días');

    // Prueba de funciones de flecha
    print('\n4. Probando funciones de flecha:');
    persona2.mostrarInformacion();
    persona2.actualizarDatos('Valencia', 'Diseñador');

    // Más ejemplos de interpolación de strings
    print('\n5. Demostración adicional de interpolación:');
    Persona persona4 = Persona('María Rodríguez', 42, 'Sevilla', 'Médica');
    
    // Diferentes formas de usar interpolación
    print('La persona se llama ${persona4.nombre.toUpperCase()}');
    print('Edad en 5 años: ${persona4.edad + 5} años');
    print('Ciudad: ${persona4.ciudad.padRight(15)} Profesión: ${persona4.profesion.padLeft(10)}');
    
    // Lista de personas
    print('\n6. Lista de personas:');
    List<Persona> personas = [
      persona1,
      persona2,
      persona4,
      Persona('Juan Pérez', 31, 'Bilbao', 'Abogado')
    ];

    for (var persona in personas) {
      print('- ${persona.nombre.padRight(15)} | ${persona.edad.toString().padLeft(3)} años | ${persona.ciudad.padRight(12)} | ${persona.profesion}');
    }
    
  } catch (e) {
    print('Error al procesar JSON: $e');
    Persona personaError = Persona.error();
    personaError.mostrarDatos();
  }

  print('\n=== FIN DE LAS PRUEBAS ===');
}
