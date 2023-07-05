import 'package:flutter/material.dart';

import '../header.dart';
const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: darkBlue,
      drawer: headerPrincipal(),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Container(

                child: IconButton(onPressed: (){
                  _scaffoldKey.currentState?.openDrawer();
                },
                  icon: Icon(Icons.menu_rounded,size: 40,),color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Center(
            child: Text('Verbos', style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 35,
              color: Colors.white
            ),
            ),
          ),
          SizedBox(height: 30,),
          Center(
            child: Text('Movimiento', style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 26,
                color: Colors.white
            ),
            ),
          ),
          Center(
            child: Text('Emociones', style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 26,
                color: Colors.white
            ),
            ),
          ),
          Center(
            child: Text('Subcategoria', style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 26,
                color: Colors.white
            ),
            ),
          ),
        ],
      ),
    );
  }
}
