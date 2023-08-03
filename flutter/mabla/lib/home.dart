import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mabla/formas/ondaHome.dart';
import 'package:mabla/header.dart';
import 'package:mabla/screen/diccionario.dart';
import 'package:mabla/screen/menu.dart';
import 'package:mabla/screen/quiz.dart';

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

  List<dynamic> comments = [];
  Future<void> getComments() async{
    // ipv4 vanessa: http://192.168.1.6/
    final url = Uri.parse('http://192.168.1.6/tablaComment');
    final response = await http.get(url);
    
    if(response.statusCode == 200){
      print("data connected successfull");
      final jsonResponse = json.decode(response.body);

      setState(() {
        comments = jsonResponse;
        //print(comments);
      });
    }
    else{
      print("data didn't connect");
    }
  }

  void initState(){
    super.initState();
    getComments();
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
                                builder: (context) => const diccionario(),
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
            SizedBox(height: 20,),
            Container(
              width: 170,
              height: 48,
              child: ElevatedButton(
                onPressed: (){

                },
                child: Text('Comenta',
                  style: TextStyle(fontSize: 25, fontFamily: "Raleway",color: Colors.black),),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(lightBlue),
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: 20,),

            ListView.builder(
                //listView se ajuste al tamaño de su contenido:
                shrinkWrap: true,
                //para evitar que el ListView.builder tenga su propio desplazamiento:
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final item =  comments[index];
                  return Container(
                      margin: EdgeInsets.only(left: 18, right: 18, top: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    child: ListTile(
                      title: Text(item['alias_id'], style: TextStyle(
                          color: Colors.grey, fontSize: 20, fontFamily: 'Raleway'
                        ),
                      ),
                      subtitle: Text(item['texto'], style: TextStyle(
                          color: Colors.black, fontSize: 20, fontFamily: 'Raleway'
                      ),
                      ),
                      //isThreeLine: true
                    ),
                  );
                }
            ),

            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
