import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mabla/formas/ondaHome.dart';
import 'package:mabla/header.dart';
<<<<<<< HEAD
import 'package:mabla/quiz/quizUI2.dart';
import 'package:mabla/quiz/splash.dart';
=======
>>>>>>> 386f5b1e8317f7011061b8aa28e90ac32d955f4d
import 'package:mabla/screen/comentarios.dart';
import 'package:mabla/screen/diccionario.dart';
import 'package:mabla/screen/menu.dart';
import 'package:mabla/quiz/quizUI.dart';

import 'package:http/http.dart' as http;

const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String message = 'Verificando sesión...';

  Future<void> verificarSesion() async {
    var url = Uri.parse('http://192.168.0.7/verificarS');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final res = responseData['mensaje'];
      setState(() {
        message = res;
        print(res);
      });
    } else {
      setState(() {
        message = 'Error al verificar la sesión';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    verificarSesion();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: headerPrincipal(),
      //backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              height: 650,
              child: Stack(
                children: [
                  ClipPath(
                  clipper: ondaHome(),
                  child: Container(
                    color: orange,
                  ),
                  ),

                  Positioned(
                    top: 30,
                    left: 10,
                    child: IconButton(onPressed: (){
                      _scaffoldKey.currentState?.openDrawer();
                    },
                      icon: Icon(Icons.menu_rounded,size: 40,),color: Colors.white,
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                          child: Image.asset('assets/img/letrasMABLA.png',)
                      ),
                      Text('Habla con las manos',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Raleway"
                        ),
                      ),
                      Text('Aprende lengua de señas colombiana',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Raleway"
                      ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: 190,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>menu()));
                          },
                            child: Text('Contenido',
                              style: TextStyle(fontSize: 28, fontFamily: "Raleway",color: Colors.black),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(beige),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 13,),
                      Container(
                        width: 190,
                        height: 48,
                        child: ElevatedButton(
<<<<<<< HEAD
                          onPressed: (){
                            final random = Random();
                            int numeroAleatorio = random.nextInt(2) + 1;
                            if (numeroAleatorio==1){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>quiz()));
                            }else{
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>quizTipoDos()));
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>quiz()));
                            }
=======
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>inicioSplash())),
>>>>>>> 13e08041fadb5f502c2527e186a18208df9dcc0a

                          child: Text('Quizes',
                            style: TextStyle(fontSize: 28, fontFamily: "Raleway",color: Colors.black),),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(beige),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 13,),
                      Container(
                        width: 190,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>diccionario(),
                              ),
                            );
                          },
                          child: Text('Diccionario',
                            style: TextStyle(fontSize: 28, fontFamily: "Raleway",color: Colors.black),),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(beige),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              )
                          ),
                        ),
                      ),
                    ],
                  )
              ]
              ),
            ),

            comentarios(),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
