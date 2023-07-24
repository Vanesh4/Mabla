import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

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

  List<dynamic> categorias = [];
  Future<void> getCategorias() async{
    final url = Uri.parse('http://192.168.1.10/getcate');
    final response = await http.get(url);

    if(response.statusCode == 200){
      print("data connected successfull");
      final jsonResponse = json.decode(response.body);

      setState(() {
        categorias = jsonResponse;
        print(categorias);
      });
    }
    else{
      print("data didn't connect");
    }
  }

  void initState(){
    super.initState();
    getCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: darkBlue,
      drawer: headerPrincipal(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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

          //Text('${categorias[0]}',
            Text('${categorias[0]}',
            style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 35,
            color: Colors.white
            ),
          ),
          SizedBox(height: 30,),
          Text('Movimiento', style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 26,
              color: Colors.white
          ),
          ),
          Text('Emociones', style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 26,
              color: Colors.white
          ),
          ),
          Text('Subcategoria', style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 26,
              color: Colors.white
          ),
          ),
        ],
      ),
    );
  }
}
