import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../home.dart';

const Color darkBlue = Color(0xFF0a4d68);
const Color beige = Color(0xFFfff7ea);

class diccionario extends StatefulWidget {
  final String letraDesdeHeader;
  diccionario({required this.letraDesdeHeader});

  @override
  _DictionaryAppState createState() => _DictionaryAppState();
}

class _DictionaryAppState extends State<diccionario> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    funcionLetraInicial();
  }
  String initial = '';
  String funcionLetraInicial() {
    if(widget.letraDesdeHeader != ''){
      initial = widget.letraDesdeHeader;
      myInitial(initial);
    }
    return initial;
  }

  List<Map<String, dynamic>> palabsenia = [];

  Future<void> myInitial(String initial) async {
    final response = await http.get(Uri.parse('http://192.168.1.8/getpalabrasdiccio/$initial'));

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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Color(0xFFd9d9d9),
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
                    margin: EdgeInsets.only(left: 50),
                    width: 250,
                    padding: EdgeInsets.only(bottom: 9, left: 25, right: 20, top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black45),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          initial = value;
                          print(initial);
                        });
                        myInitial(initial);
                      },
                      decoration: InputDecoration(
                        hintText: 'Busca vocabulario',
                        contentPadding: EdgeInsets.only(top: 3, left: 5),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 16,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: palabsenia.map((item) {
                  final palabra = item['palabra'];
                  final senia = item['senia'];
                  return GestureDetector(
                    onTap: () {

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.network(senia, height: 200),
                                Text(
                                  palabra,
                                  style: TextStyle(fontFamily: 'Raleway', fontSize: 30),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Container(
                        width: 300,
                        margin: EdgeInsets.only(right: 20),
                        child: Card(
                          shadowColor: Color(0xFF0a4d68),
                          elevation: 4.0,
                          margin: EdgeInsets.only(top: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.network(senia, height: 200),
                              Text(
                                palabra,
                                style: TextStyle(fontFamily: 'Raleway', fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
