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
    print("on the funtion");
    //vanessa: 192.168.1.6
    final url = Uri.parse('http://10.190.88.159/getcate');
    final response = await http.get(url);

    if(response.statusCode == 200){
      print("data categorias connected successfull");
      final jsonResponse = json.decode(response.body);

      setState(() {
        categorias = jsonResponse;
        print(categorias);
      });
    }
    else{
      print("data categorias didn't connect");
    }
  }
  
  Future<List<dynamic>> SubCategorias(String cat) async{
    print("on the funtion 2");
    final url = 'http://10.190.88.159/getSubcategorias/$cat';
    print(url);
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      print("Status code 200");
      final data = json.decode(response.body);
      return List.from(data);
    }
    else{
      print('Failed to load subcategorias');
      throw Exception('Failed to load data');
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
      body:
          /*Align(
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
          ),*/

          ListView.builder(
            itemCount: categorias.length,
            itemBuilder: (context, index){
              final item = categorias[index];
              return
              Container(
                child: Column(
                  children: [
                    Text(item['Categoria']),
                    FutureBuilder<List<dynamic>>(
                      future: SubCategorias(item['Categoria']),
                      builder: (context, snapshot){
                        final subcates = snapshot.data;

                        if(subcates == null || subcates.isEmpty){
                          return Text('');
                        }
                        final firstItem = subcates.first;
                        final itemName = firstItem['name'] ?? '';

                        return Text(itemName);
                      },
                    ),
                  ],
                ),
              );
            },

          )



    );
  }
}
