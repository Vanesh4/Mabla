import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mabla/header.dart';
import 'package:mabla/formas/ondaHome.dart';
import 'package:mabla/home.dart';

class miperfil extends StatefulWidget {
  const miperfil({Key? key}) : super(key: key);

  @override
  State<miperfil> createState() => _miperfilState();
}

class _miperfilState extends State<miperfil> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  get borderRadius => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: headerPrincipal(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 300,
                        child: Stack(
                          children: [
                            ClipPath(
                              clipper: ondaHome(),
                              child: Container(
                                color: Colors.deepOrange,
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


                          ],

                        ),

                      )

                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 220,
                          margin: EdgeInsets.only(top: 80),
                          child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                              child: Image.asset('assets/img/user.png')
                          ),
                        ),
                      )


                    ],
                  )

                ],
              ),
              height: 350,

      ),
            Row(
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.only(left: 20, top: 60),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Escribe tu comentario...',
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)
                    ),
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 20
                    ),

                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(top: 60),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      child: Image.asset('assets/img/lupa.png')
                  ),

                )
              ],
            ),

            Row(
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.only(left: 20, top: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Escribe tu comentario...',
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)
                    ),
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 20
                    ),

                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      child: Image.asset('assets/img/lupa.png')
                  ),

                )
              ],
            ),

            Row(
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.only(left: 20, top: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Escribe tu comentario...',
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)
                    ),
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 20
                    ),

                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      child: Image.asset('assets/img/lupa.png')
                  ),

                )
              ],
            ),



            Row(
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.only(left: 20, top: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Escribe tu comentario...',
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)
                    ),
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 20
                    ),

                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      child: Image.asset('assets/img/lupa.png')
                  ),

                )
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 40),

              child: ElevatedButton(

                child: Text("Mi proceso"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  //side: BorderSide(color: Colors.yellow, width: 5),
                  shape: borderRadius: BorderRadius.all(Radius.circular(10)),
                  textStyle: const TextStyle(color: Colors.white, fontSize: 25),
                  shadowColor: Colors.lightBlue,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home()
                )
                  );

              },
              ),



            )



          ],
        ),

      ),

    );

  }



}

