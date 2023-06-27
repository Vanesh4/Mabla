import 'package:flutter/material.dart';
import 'package:mabla/formas/ondaHome.dart';

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
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/carpincho.png', width: 150,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){},
                    child: Text('Contenido',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        color: Colors.black
                      ),
                    )
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){},
                    child: Text('Sobre Nosotros',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Raleway',
                          color: Colors.black
                      ),
                    )
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            )

          ],
        )
      ),
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
                      Text('Aprende lengua de señas colombiana',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Raleway"
                      ),),
                      SizedBox(height: 20,),
                      Container(
                        width: 200,
                        child: ElevatedButton(onPressed: (){},
                            child: Text('Contenido',
                              style: TextStyle(fontSize: 22, fontFamily: "Raleway",color: Colors.black),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(beige),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        child: ElevatedButton(onPressed: (){},
                          child: Text('Quizes',
                            style: TextStyle(fontSize: 22, fontFamily: "Raleway",color: Colors.black),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(beige),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        child: ElevatedButton(onPressed: (){},
                          child: Text('Diccionario',
                            style: TextStyle(fontSize: 22, fontFamily: "Raleway",color: Colors.black),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(beige),
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
