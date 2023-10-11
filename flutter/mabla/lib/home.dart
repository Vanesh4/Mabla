import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mabla/formas/ondaHome.dart';
import 'package:mabla/header.dart';
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
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>quiz()));
                          },
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
