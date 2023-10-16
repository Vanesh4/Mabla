import 'package:flutter/material.dart';

class MyAppprueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedOption = 'Opción 1';

  void _onDropdownChanged(String newValue) {
    setState(() {
      _selectedOption = newValue;
    });
  }

  Widget _buildMainContent() {
    if (_selectedOption == 'Opción 1') {
      return Center(
        child: Text('Contenido para la Opción 1'),
      );
    } else if (_selectedOption == 'Opción 2') {
      return Center(
        child: Text('Contenido para la Opción 2'),
      );
    } else if (_selectedOption == 'Opción 3') {
      return Center(
        child: Text('Contenido para la Opción 3'),
      );
    } else {
      return Center(
        child: Text('Contenido para la Opción 4'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contenido Dinámico')),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Usuario'),
              accountEmail: Text('usuario@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              title: Text('Opción 1'),
              onTap: () {
                _onDropdownChanged('Opción 1');
                Navigator.pop(context); // Cerrar el Drawer
              },
            ),
            ListTile(
              title: Text('Opción 2'),
              onTap: () {
                _onDropdownChanged('Opción 2');
                Navigator.pop(context); // Cerrar el Drawer
              },
            ),
            ListTile(
              title: Text('Opción 3'),
              onTap: () {
                _onDropdownChanged('Opción 3');
                Navigator.pop(context); // Cerrar el Drawer
              },
            ),
            ListTile(
              title: Text('Opción 4'),
              onTap: () {
                _onDropdownChanged('Opción 4');
                Navigator.pop(context); // Cerrar el Drawer
              },
            ),
          ],
        ),
      ),
      body: _buildMainContent(),
    );
  }
}