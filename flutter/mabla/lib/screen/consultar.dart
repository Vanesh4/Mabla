import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../home.dart';
import '../quiz/splash.dart';

class Categoria {
  final String nombre;
  final List<Subcategoria> subcategorias;

  Categoria({required this.nombre, required this.subcategorias});
}

class Subcategoria {
  final String nombre;
  final String categoria;
  final List<Palabra> palabras;

  Subcategoria({required this.nombre, required this.categoria, required this.palabras});
}

class Palabra {
  final String palabra;
  final String senia;

  Palabra({required this.palabra, required this.senia});
}

class consultar extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<consultar> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Categoria> categorias = [];
  Subcategoria? subcategoriaSeleccionada;
  bool isTextVisible = true;

  Future<void> obtenerDatosDesdeDjango() async {
    final response = await http.get(Uri.parse('http://192.168.1.6/getcategoria'));

    if (response.statusCode == 200) {
      setState(() {
        final List<dynamic> data = json.decode(response.body);
        categorias = data.map((categoriaData) {
          return Categoria(
            nombre: categoriaData['Categoria'],
            subcategorias: (categoriaData['Subcategorias'] as List<dynamic>).map((subcategoriaData) {
              return Subcategoria(
                nombre: subcategoriaData['subcategoria'],
                categoria: categoriaData['Categoria'],
                palabras: (subcategoriaData['palabraas'] as List<dynamic>).map((palabraData) {
                  return Palabra(
                    palabra: palabraData['palabra'],
                    senia: palabraData['senia'],
                  );
                }).toList(),
              );
            }).toList(),
          );
        }).toList();
      });
    } else {
      throw Exception('Error al cargar los datos en la URL');
    }
  }

  @override
  void initState() {
    super.initState();
    obtenerDatosDesdeDjango();
    isTextVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0a4d68),
        elevation: 0.0,
        title: Row(
          children: [],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF0a4d68),
        width: 250,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => home())),
                child: Image.asset('assets/img/Megalogo.png', width: 100),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categorias.length,
                itemBuilder: (BuildContext context, int indexCategoria) {
                  final categoria = categorias[indexCategoria];
                  return Center(
                    child: ExpansionTile(
                      title: Center(
                        child: Text(
                          categoria.nombre,
                          style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                        ),
                      ),
                      children: categoria.subcategorias.map((subcategoria) {
                        return ListTile(
                          title: Container(
                            child: Text(
                              subcategoria.nombre,
                              style: TextStyle(fontFamily: 'Raleway',color: Colors.white),
                            ),
                            margin: EdgeInsets.only(left: 40,top:0),
                          ),
                          onTap: () {
                            setState(() {
                              isTextVisible = false;
                              subcategoriaSeleccionada = subcategoria;
                            });
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (subcategoriaSeleccionada != null)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    subcategoriaSeleccionada?.palabras.length ?? 0,
                        (index) {
                      final palabra = subcategoriaSeleccionada?.palabras[index];
                      return Container(
                        width: 300,
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.network(
                                  palabra?.senia ?? '',
                                  height: 200,
                                ),
                                Text(
                                  palabra?.palabra ?? '',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: "Raleway",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          Container(
            child: Center(
              child: Visibility(
                visible: isTextVisible,
                child: Center(
                  child: Text(
                    'Tu texto en la mitad de la pantalla',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (subcategoriaSeleccionada != null)
            ElevatedButton(
              onPressed: () {
                final categoriaSeleccionada = subcategoriaSeleccionada?.categoria ?? '';
                print(categoriaSeleccionada);
                Navigator.push(context, MaterialPageRoute(builder: (context) => inicioSplash(cat: categoriaSeleccionada)));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0a4d68),
                onPrimary: Colors.white,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Presentar Quiz',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}







/*

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mabla/quiz/splash.dart';
import 'dart:convert';


import '../header.dart';
import '../home.dart';


class Categoria {
  final String nombre;
  final List<Subcategoria> subcategorias;

  Categoria({required this.nombre, required this.subcategorias});
}

class Subcategoria {
  final String nombre;
  final String categoria;
  final List<Palabra> palabras;

  Subcategoria({required this.nombre, required this.categoria, required this.palabras});
}

class Palabra {
  final String palabra;
  final String senia;

  Palabra({required this.palabra, required this.senia});
}

class consultar extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<consultar> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Categoria> categorias = []; // Lista para almacenar las categorías y subcategorías
  Subcategoria? subcategoriaSeleccionada; // se selecciona la subcategoria
  bool isTextVisible = true;

  Future<void> obtenerDatosDesdeDjango() async {

    final response = await http.get(Uri.parse('http://192.168.1.6/getcategoria'));



    if (response.statusCode == 200) {
      setState(() {
        final List<dynamic> data = json.decode(response.body);
        categorias = data.map((categoriaData) {
          return Categoria(
            nombre: categoriaData['Categoria'],
            subcategorias: (categoriaData['Subcategorias'] as List<dynamic>).map((subcategoriaData) {
              return Subcategoria(
                nombre: subcategoriaData['subcategoria'],
                categoria: categoriaData['Categoria'],
                palabras: (subcategoriaData['palabraas'] as List<dynamic>).map((palabraData) {
                  return Palabra(
                    palabra: palabraData['palabra'],
                    senia: palabraData['senia'],
                  );
                }).toList(),
              );
            }).toList(),
          );
        }).toList();
      });
    } else {
      throw Exception('Error al cargar los datos en la URL');
    }
  }

  @override
  void initState() {
    super.initState();
    obtenerDatosDesdeDjango();
    isTextVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0a4d68),
        elevation: 0.0,
        title: Row(
          children: [


          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF0a4d68),
        width: 250,
        child: Column(
          children: [
          *//* UserAccountsDrawerHeader(
              accountName: Text("Nombre del Usuario"),
              accountEmail: Text("usuario@example.com"),
              currentAccountPicture: CircleAvatar(
                // Puedes usar una imagen de perfil aquí
                backgroundColor: Colors.white,
                child: Text("U", style: TextStyle(fontSize: 40.0)),
              ),
            ),*//*
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child:GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>home())),
                  child: Image.asset('assets/img/Megalogo.png', width: 100,)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categorias.length,
                itemBuilder: (BuildContext context, int indexCategoria) {
                  final categoria = categorias[indexCategoria];
                  return Center(
                    child: ExpansionTile(
                      title: Center(
                        child: Text(
                          categoria.nombre,
                          style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                        ),
                      ),
                      children: categoria.subcategorias.map((subcategoria) {
                        return ListTile(
                          title: Container(
                            child: Text(

                              subcategoria.nombre,
                              style: TextStyle(fontFamily: 'Raleway',color: Colors.white),
                            ),
                            margin: EdgeInsets.only(left: 40,top:0),

                          ),
                          onTap: () {
                            isTextVisible = false;
                            setState(() {
                              subcategoriaSeleccionada = subcategoria;
                            });
                            Navigator.pop(context); // Cierra el Drawer
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Expanded(
            child: ListView.builder(
              itemCount: subcategoriaSeleccionada?.palabras.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final palabra = subcategoriaSeleccionada?.palabras[index];
                return Center(
                  child: Container(
                    width: 300,
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.network(
                              palabra?.senia ?? '',
                              height: 200,
                            ),
                            Text(
                              palabra?.palabra ?? '',
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Raleway",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(

            child: Center(
              child: Visibility(
                visible: isTextVisible,
                child: Center(
                  child: Text(
                    'Tu texto en la mitad de la pantalla',
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ),
            ),
          ),

          if (subcategoriaSeleccionada != null)
            ElevatedButton(
              onPressed: () {
                final categoriaSeleccionada = subcategoriaSeleccionada?.categoria ?? '';
                Navigator.push(context, MaterialPageRoute(builder: (context) => inicioSplash(cat: categoriaSeleccionada)));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0a4d68),
                onPrimary: Colors.white,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Presentar Quiz',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),

    );
  }
}*/


/* Container(
          color: Colors.deepOrange,
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(bottom: 18, top: 0, left: 70),
          child: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
              Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
            },
            icon: Icon(Icons.home, size: 50),
            color: Color(0xFFff731c),
          ),
        ),*/









/*
class consultar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  List<dynamic> datos=[];

  Future<void> consultDatos() async{
    print("holaaa");
    final url=Uri.parse('http://192.168.1.6/getcategoria');
    print("hellooooo");
    final respuesta=await http.get(url);
    if(respuesta.statusCode==200){
      print("la Api se conecto de manera correcta");
      final jsonResponse=json.decode(respuesta.body);
      setState(() {
        datos=jsonResponse;
        print(datos);
      });
    }else{
      print("Error: no se consultó la Api");
    }
  }



  void initState(){
    super.initState();
    consultDatos();
  }


  List<String> dropdownItems = [];

  String selectedOption = '';

  void _showDropdown(List<String> items) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: items.map((item) {
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    selectedOption = item;
                  });
                  Navigator.of(context).pop(); // Cerrar el diálogo
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Aprende Lengua de señas'),
      ),
      drawer: Drawer(

       child: ListView.builder(itemCount: datos.length,
            itemBuilder: (context, index){
              final subdecategorias=datos.Subcategorias;
              final item=datos[index];
              final todos=datos.length;
              padding: EdgeInsets.zero;

                return ListTile(

                  title: Column(
                    children: [
                      Text(item['Categoria']),
                      Text(item['Subcategorias'])
                    ],
                  ),

                  onTap: () {
                    Navigator.of(context).pop(); // Cerrar el drawer
                    _showDropdown(['Opción 3-1', 'Opción 3-2', 'Opción 3-3']);
                    // Aquí puedes manejar la acción cuando se selecciona un elemento del Drawer
                  },


                );

  }
        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
*/
/*

            Container(
              child: Expanded(
                child: ListView.builder(itemCount: datos.length,
                    itemBuilder: (context, index){
                      final item=datos[index];
                      final todos=datos.length;
                      return ListBody(
                        children: [
                          Card(
                            color: Colors.indigo,
                            child: Row(
                              children: [
                                Text(item['Categoria'],),

                              ],
                            ),

                          ),
                        ],

                      );

                    }


                ),
              ),
            ),*//*

            if (selectedOption.isNotEmpty)
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Seleccionado: $selectedOption'),
              ),
            ElevatedButton(
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abrir el drawer desde el cuerpo
              },
              child: Text('Abrir Drawer'),
            ),
          ],
        ),
      ),
    );
  }
}
*/





