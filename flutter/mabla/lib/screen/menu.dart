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
    final response = await http.get(Uri.parse('http://192.168.43.184/getcate'));

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
      body: ListView.builder(
        itemCount: CateSubcate.length,
        itemBuilder: (context, index) {
          final cat = CateSubcate[index];
          final subcat = cat['Subcategorias'] ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Center(
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        textTransform: TextTransform.uppercase, // Convierte el texto a mayúsculas
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Este es un ejemplo de texto en mayúsculas.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (subcat.isNotEmpty)
                Column(
                  children: subcat.map<Widget>((subelemento) {
                    return ListTile(
                      title: Text(subelemento['subcategoria'], style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 28,
                          color: Colors.white
                      ),),
                    );
                  }).toList(),
                ),
            ],
          );
        },
      ),
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





    );
  }
}
