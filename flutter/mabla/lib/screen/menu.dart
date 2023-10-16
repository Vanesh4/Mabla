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

  List<dynamic> CateSubcate = [];
  //Map<String, dynamic> jsonData = {};
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.1.8/getcate'));

    if (response.statusCode == 200) {
      print("All is OK in cate and subcate");
      setState(() {
        CateSubcate = json.decode(response.body);
        //jsonData = json.decode(response.body);

      });
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: darkBlue,
      drawer: headerPrincipal(),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: CateSubcate.length,
            itemBuilder: (context, index) {
              final cat = CateSubcate[index];
              final subcat = cat['Subcategorias'] ?? [];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  ListTile(
                    title: Center(
                      child: RichText(text: TextSpan(
                        text: cat['Categoria'].toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 25,
                            color: Colors.white
                        ),
                      ))
                    ),
                  ),
                  if (subcat.isNotEmpty)
                    Column(
                      children: subcat.map<Widget>((subelemento) {
                        return Center(
                          child: RichText(text: TextSpan(
                            text: subelemento['subcategoria'],
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 20,
                                color: Colors.white
                            ),
                          )),
                        );
                      }).toList(),
                    ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Container(
              child: IconButton(onPressed: (){
                _scaffoldKey.currentState?.openDrawer();
              },
                icon: Icon(Icons.menu_rounded,size: 40,),color: Colors.white,
              ),
            ),
          ),

        ]
      ),
    );
  }



}
