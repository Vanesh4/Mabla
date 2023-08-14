import 'package:flutter/material.dart';

class consultar extends StatefulWidget {
  const consultar({Key? key}) : super(key: key);

  @override
  State<consultar> createState() => _consultarState();
}

class _consultarState extends State<consultar> {
  //funcion para lista desplegable
/*  String _selectedOption1 = 'opcion1';// Valor predeterminado
  String _selectedOption2 = 'opcion1';
  String _selectedOption3 = 'opcion1';
  String _selectedOption4 = 'opcion1';
  String _selectedOption5 = 'opcion1';
  String _selectedOption6 = 'opcion1';
  String _selectedOption7 = 'opcion1';
  String _selectedOption8 = 'opcion1';
  String _selectedOption9 = 'opcion1';*/
  String _selectedOption10 = 'opcion1';


/*
  void _onDropdownChanged1(String? newValue) {
    setState(() {
      _selectedOption1 = newValue!;
    });
  }

  void _onDropdownChanged2(String? newValue) {
    setState(() {
      _selectedOption2 = newValue!;
    });
  }

  void _onDropdownChanged3(String? newValue) {
    setState(() {
      _selectedOption3 = newValue!;
    });
  }

  void _onDropdownChanged4(String? newValue) {
    setState(() {
      _selectedOption4 = newValue!;
    });
  }

  void _onDropdownChanged5(String? newValue) {
    setState(() {
      _selectedOption5 = newValue!;
    });
  }

  void _onDropdownChanged6(String? newValue) {
    setState(() {
      _selectedOption6 = newValue!;
    });
  }

  void _onDropdownChanged7(String? newValue) {
    setState(() {
      _selectedOption7 = newValue!;
    });
  }

  void _onDropdownChanged8(String? newValue) {
    setState(() {
      _selectedOption8 = newValue!;
    });
  }

  void _onDropdownChanged9(String? newValue) {
    setState(() {
      _selectedOption9 = newValue!;
    });
  }
*/

  void _onDropdownChanged10(String? newValue) {
    setState(() {
      _selectedOption10 = newValue!;
    });
  }

  Widget _buildMainContent() {
    if(_selectedOption10 == 'opcion1') {
      return Center(
        child: Text('Contenido para la Opción 1'),
      );
    } else if (_selectedOption10 == 'opción2') {
      return Center(
        child: Text('Contenido para la Opción 2'),
      );
    } else if (_selectedOption10 == 'opción3') {
      return Center(
        child: Text('Contenido para la Opción 3'),
      );
    } else {
      return Center(
        child: Container(
          height: 200,
          color: Colors.red[100],
          child: Text("por que no funcionas"),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        child: Container(
            color: Color(0xFF0a4d68),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(top: 40),
                child: Image.asset('assets/img/Megalogo.png'),
              ),
              const Text("MABLA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),

              /*Text('Valor seleccionado: $_selectedOption1'),
              SizedBox(height: 60),
              DropdownButton<String>(
                underline: Container( // Personalización de la línea de abajo
                  height: 20,

                ),
                value: _selectedOption1,
                onChanged: _onDropdownChanged1,
                items: <String>['opcion1', 'opcion2', 'opcion3', 'opcion4']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),


              DropdownButton<String>(
                padding: EdgeInsets.only(top: 13),
                underline: Container( // Personalización de la línea de abajo
                  height: 20,

                ),
                value: _selectedOption2,
                onChanged: _onDropdownChanged2,
                items: <String>['opcion1', 'opcion2', 'opcion3', 'opcion4']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              DropdownButton<String>(
                padding: EdgeInsets.only(top: 13),
                underline: Container( // Personalización de la línea de abajo
                  height: 20,

                ),
                value: _selectedOption3,
                onChanged: _onDropdownChanged3,
                items: <String>['opcion1', 'opcion2', 'opcion3', 'opcion4']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              DropdownButton<String>(
                padding: EdgeInsets.only(top: 13),
                underline: Container( // Personalización de la línea de abajo
                  height: 20,

                ),
                value: _selectedOption4,
                onChanged: _onDropdownChanged4,
                items: <String>['opcion1', 'opcion2', 'opcion3', 'opcion4']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              DropdownButton<String>(
                padding: EdgeInsets.only(top: 13),
                underline: Container( // Personalización de la línea de abajo
                  height: 20,

                ),
                value: _selectedOption5,
                onChanged: _onDropdownChanged5,
                items: <String>['opcion1', 'opcion2', 'opcion3', 'opcion4']
                    .map<DropdownMenuItem<String>>((String value)  {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),

                  );
                }).toList(),
              ),

              DropdownButton<String>(
                padding: EdgeInsets.only(top: 13),
                underline: Container( // Personalización de la línea de abajo
                  height: 20,

                ),
                value: _selectedOption6,
                onChanged: _onDropdownChanged6,
                items: <String>['opcion1', 'opcion2', 'opcion3', 'opcion4']
                    .map<DropdownMenuItem<String>>((String value)  {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),

                  );
                }).toList(),
              ),

              DropdownButton<String>(
                padding: EdgeInsets.only(top: 13),
                underline: Container( // Personalización de la línea de abajo
                  height: 20,

                ),
                value: _selectedOption7,
                onChanged: _onDropdownChanged7,
                items: <String>['opcion1', 'opcion2', 'opcion3', 'opcion4']
                    .map<DropdownMenuItem<String>>((String value)  {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),

                  );
                }).toList(),
              ),

              DropdownButton<String>(
                padding: EdgeInsets.only(top: 13),
                underline: Container( // Personalización de la línea de abajo
                  height: 20,

                ),
                value: _selectedOption8,
                onChanged: _onDropdownChanged8,
                items: <String>['opcion1', 'opcion2', 'opcion3', 'opcion4']
                    .map<DropdownMenuItem<String>>((String value)  {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),

                  );
                }).toList(),
              ),

              DropdownButton<String>(
                padding: EdgeInsets.only(top: 13),
                underline: Container( // Personalización de la línea de abajo
                  height: 20,

                ),
                value: _selectedOption9,
                onChanged: _onDropdownChanged9,
                items: <String>['opcion1', 'opcion2', 'opcion3', 'opcion4']
                    .map<DropdownMenuItem<String>>((String value)  {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),

                  );
                }).toList(),
              ),*/

              DropdownButton<String>(
                padding: EdgeInsets.only(top: 13),
                underline: Container( // Personalización de la línea de abajo
                  height: 20,

                ),
                value: _selectedOption10,
                onChanged: _onDropdownChanged10,
                items: <String>['opcion1', 'opcion2', 'opcion3', 'opcion4']
                    .map<DropdownMenuItem<String>>((String value)  {
                  return DropdownMenuItem<String>(
                    onTap: (){
                      _onDropdownChanged10(_selectedOption10);
                      Navigator.pop(context);
                    },
                    value: value,
                    child: Text(value),

                  );
                }).toList(),
              ),

            ],
          ),

        ),
      ),




      appBar: AppBar(
          backgroundColor: Color(0xFF0a4d68),
        title: const Text('Explora nuestro contenido'),
      ),

      body: _buildMainContent(),

    );

  }
}



