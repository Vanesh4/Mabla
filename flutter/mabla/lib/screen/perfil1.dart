import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class perfil1 extends StatefulWidget {
  const perfil1({super.key});

  @override
  State<perfil1> createState() => _perfil1State();
}

class _perfil1State extends State<perfil1> {

  File? _image;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Map<String, dynamic> _perfilData = {};
  Future<void> _obtenerPerfil() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('jwt_token') ?? '';

    final response = await http.get(
      Uri.parse('http://192.168.43.184/perfil'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken',

      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      final jsonResponse = json.decode(response.body);
      final token = jsonResponse['access'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('jwt_token', token);
      setState(() {
        _perfilData = jsonResponse;
      });
    } else{
      // La respuesta redirige a otra URL (manejar según tu lógica)
      print(response.statusCode);
      final redirectUrl = response.headers['location'];
      if (redirectUrl != null) {
        await launch(redirectUrl);
      }
    }
  }
  @override
  void initState() {
    super.initState();
    _obtenerPerfil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('Perfil de Cliente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('alias: ${_perfilData['alias']}'),
            Text('first_name: ${_perfilData['first_name']}'),
            Text('last_name: ${_perfilData['last_name']}'),
            Text('email: ${_perfilData['email']}'),
            Text('imgPerfil: ${_perfilData['imgPerfil']}'),
          ],
        )
      ),
    );
  }
}
