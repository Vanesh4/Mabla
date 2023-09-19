import 'package:flutter/material.dart';
import '../home.dart';
import 'headerAbecedario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);
const Color gris = Color(0xFFd9d9d9);


class diccionario extends StatefulWidget {
  const diccionario({super.key});

  @override
  State<diccionario> createState() => _diccionarioState();
}

class _diccionarioState extends State<diccionario> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String initial = ''; // Inicial por defecto
  List<Map<String, dynamic>> palabsenia = [];

  Future<void> myInitial(String initial) async {
    final response = await http.get(Uri.parse('http://10.190.88.115/getpalabrasdiccio/$initial'));
    print(response.body);


    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> palabras = data['palabras'];

      setState(() {
        palabsenia = List<Map<String, dynamic>>.from(palabras);
      });
    } else {
      throw Exception('Error al cargar las palabras');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: abecedario(),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: <Widget>[
              Container(
                color: gris,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(bottom: 18, top: 10),
                      child: IconButton(onPressed: (){
                        _scaffoldKey.currentState?.openEndDrawer();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                      },
                        icon: Icon(Icons.home,size: 50,),color: darkBlue,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 10),
                      padding: EdgeInsets.only(bottom: 9, left: 25, right: 20, top: 5),
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.black45)
                      ),
                      child: TextField(
                        onChanged: (value) {
                        setState(() {
                          initial = value;
                          print(initial);
                        });
                      },

                        decoration: InputDecoration(
                          hintText: 'Busca vocabulario',
                          contentPadding: EdgeInsets.only(top: 3, left: 5),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none, // Cambia este valor al color deseado
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none, // Cambia este valor al color deseado
                          ),

                         suffixIcon: IconButton(
                            onPressed: () {
                              myInitial(initial);
                            },
                            icon: Icon(Icons.search,size: 25,),color: darkBlue
                          ),



                        ), style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 16
                        ),
                      ),



                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: IconButton(onPressed: (){
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                        icon: Icon(Icons.chevron_left_sharp, size: 80),color: darkBlue,
                      ),
                    ),
                  ],
                ),
              ),

             /* ElevatedButton(
                onPressed: () {
                  // Llamamos a la función con la inicial ingresada por el usuario.
                  myInitial(initial);
                },
                child: Text('Buscar'),
              ),*/
              Expanded(
                child: ListView.builder(
                  itemCount: palabsenia.length,
                  itemBuilder: (context, index) {
                    final palabra = palabsenia[index]['palabra'];
                    final senia = palabsenia[index]['senia'];
                    return Card(
                      elevation: 4.0, // Add shadow to the card
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                          Image.network(senia),
                          Text(palabra),


                    ]
                    )
                    );

                  },

                ),
              ),
             ]
          )
        )

    );
  }
}

