import 'package:flutter/material.dart';
import 'package:mabla/formas/ondaHome.dart';
import 'package:mabla/header.dart';
import 'package:mabla/screen/menu.dart';

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
              /*child: CustomPaint(
                painter: ondaHome(),
                size: Size(double.infinity, double.infinity),
              ),*/
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
                          onPressed: (){},
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
                          onPressed: (){},
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.2),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.only(left: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'comenta...',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)
                ),
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 20
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
