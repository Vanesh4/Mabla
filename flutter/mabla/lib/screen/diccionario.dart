import 'package:flutter/material.dart';
import '../home.dart';
import 'headerAbecedario.dart';

const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);

class diccionario extends StatefulWidget {
  const diccionario({super.key});

  @override
  State<diccionario> createState() => _diccionarioState();
}

class _diccionarioState extends State<diccionario> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: abecedario(),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(bottom: 18, right: 2),
                      child: IconButton(onPressed: (){
                        _scaffoldKey.currentState?.openEndDrawer();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                      },
                        icon: Icon(Icons.home,size: 50,),color: darkBlue,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 13),
                      padding: EdgeInsets.only(bottom: 9, left: 20, right: 20, top: 5),
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                          color: beige,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.black45)
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Busca vocabulario...',
                          contentPadding: EdgeInsets.only(top: 3),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none, // Cambia este valor al color deseado
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: darkBlue),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                            },
                            icon: Icon(Icons.search,size: 25,),color: darkBlue,
                          ),
                        ), style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 16
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(bottom: 15),
                      child: IconButton(onPressed: (){
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                        icon: Icon(Icons.menu_rounded,size: 50,),color: darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // Número de elementos en la lista
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: 300,
                          height: 300,
                          color: beige,
                        ),
                        ListTile(
                          title: Text('Elemento ${index + 1}',textAlign: TextAlign.center,),
                          subtitle: Text('Este es el subtitulo del elemento ${index + 1}',textAlign: TextAlign.center,),
                        ),
                        SizedBox(height: 20),
                      ],
                      );
                    },
                ),
              )
             ]
          )
        )

    );
  }
}
