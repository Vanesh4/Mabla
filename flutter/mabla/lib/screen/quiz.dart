import 'package:flutter/material.dart';

import '../header.dart';

const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);

class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: headerPrincipal(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(

                child: IconButton(onPressed: (){
                  _scaffoldKey.currentState?.openDrawer();
                },
                  icon: Icon(Icons.menu_rounded,size: 40,),color: Colors.black,
                ),
              ),
            ),
          ),

          Text("A que palabra corresponde esta seña", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontFamily: "Raleway"),),
          SizedBox(height: 10,),
          Container(
            width: 250,
            height: 250,
            color: Colors.grey
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.arrow_back_ios_new_rounded, size: 70,),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      color: purple,
                      height: 80,
                      width: double.infinity,
                      child: Center(
                        child: Text("opcion uno",
                          style:TextStyle(color: Colors.white,
                          fontFamily: "Raleway",
                            fontSize: 28
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      color: darkBlue,
                      height: 80,
                      width: double.infinity,
                      child: Center(
                        child: Text("opcion dos",
                          style:TextStyle(color: Colors.white,
                              fontFamily: "Raleway",
                              fontSize: 28
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      color: lightBlue,
                      height: 80,
                      width: double.infinity,
                      child: Center(
                        child: Text("opcion tres",
                          style:TextStyle(color: Colors.white,
                              fontFamily: "Raleway",
                              fontSize: 28
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      color: orange,
                      height: 80,
                      width: double.infinity,
                      child: Center(
                        child: Text("opcion cuatro",
                          style:TextStyle(color: Colors.white,
                              fontFamily: "Raleway",
                              fontSize: 28
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded,size: 70,)
            ],
          )
        ],
      ),
    );

  }
}
