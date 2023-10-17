import 'package:flutter/material.dart';
import 'package:mabla/home.dart';
import 'package:mabla/screen/consultar.dart';
import 'package:mabla/screen/diccionario.dart';
import 'package:mabla/screen/login.dart';
import 'package:mabla/screen/perfil1.dart';

void main() {
  runApp(const MyApp());
}

//sara
/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
        '/': (context) => home(), // Página de inicio de sesión
        '/perfil': (context) => perfil1(), // Página de perfil del cliente
        '/ingresar': (context) => login(), // Página de perfil del cliente
        // Define otras rutas aquí
      },
    );
  }
}*/

//karen

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: diccionario(),
    );
  }
}


//vanessa
/*class MyApp extends StatelessWidget {
=======
/*
class MyApp extends StatelessWidget {
>>>>>>> e7f46b62a8a14b45f3d1a398ba0c62f9729170bd
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home()
    );
  }
<<<<<<< HEAD
}*/
=======
}
*/
/*
colores:
azul oscuro: #0a4d68
azul claro: #06bfdb
morado: #76037a
naranja: #ff731c
beige:#fff7ea

*/
