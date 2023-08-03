import 'package:flutter/material.dart';
import 'package:mabla/home.dart';
<<<<<<< HEAD
import 'package:mabla/screen/login.dart';
import 'package:mabla/screen/perfil.dart';
import 'package:mabla/screen/quiz.dart';
=======
import 'package:mabla/screen/registro.dart';
>>>>>>> 1c84692fee3132833fa566067095805ef9ffe4cb


void main() {
  runApp(const MyApp());
}

//sara
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
          child: registro()
        ),
    );
  }
}

//karen
/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    );
  }
}*/

//vanessa
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: miperfil()
    );
  }
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
