import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);

class registro extends StatefulWidget {
  const registro({super.key});

  @override
  State<registro> createState() => _registroState();
}

class _registroState extends State<registro> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _alias = TextEditingController();
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _apellido = TextEditingController();
  final TextEditingController _telefono = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _clave = TextEditingController();
  final TextEditingController _confirmClave = TextEditingController();

  bool _obscureText = true;
/*File? _image;

  Future<void> _pickImage() async {
    final pickedImage =
    await ImagePicker.getImage(source: ImageSource.gallery)

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }*/

  void dispose() {
    _alias.dispose();
    _nombre.dispose();
    _apellido.dispose();
    _telefono.dispose();
    _email.dispose();
    _clave.dispose();
    _confirmClave.dispose();
    super.dispose();
  }

  void _postForm() async {
    if (_formKey.currentState!.validate()) {
      if (_clave.text == _confirmClave.text) {
        print(_alias.text);
        print(_nombre.text);
        print( _apellido.text);
        print( _telefono.text);
        print( _email.text);
        print(_clave.text);
        print(_confirmClave.text);

        final String apiUrl = 'http://192.168.0.13/registroForm';

        final Map<String, dynamic> requestBody = {
          'username': _alias.text,
          'first_name': _nombre.text,
          'last_name': _apellido.text,
          'telefono': _telefono.text,
          'email': _email.text,
          'password1': _clave.text,
          'password2':_confirmClave.text
        };
        print("Datos enviados desde Flutter:");
        print(requestBody); // Imprime el contenido de requestBody
        final respuesta = await http.post(
          Uri.parse(apiUrl),
          headers: {'content-type': 'application/json'},
          body: json.encode(requestBody),
        );

        if (respuesta.statusCode == 200) {
          print("Usuario registrado correctamente");
          // Puedes redirigir a otra página o mostrar un mensaje de éxito
        } else {
          print("Error al registrar el usuario");
        }
      } else {
        // Las contraseñas no coinciden, muestra un mensaje de error
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Las contraseñas no coinciden.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Aceptar'),
                ),
              ],
            );
          },
        );
      }
    }
  }
  List<String> label = ['Nombre', 'Apellido', 'Teléfono', 'Correo electrónico', 'Nombre de usuario (Alias)', 'Clave', 'Confirma tu clave'];
  List<TextEditingController> _controllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/img/pico.svg',
              colorFilter: ColorFilter.mode(purple, BlendMode.srcIn),
              width: double.infinity,
              height: 840,
              // Cambia "Colors.red" por el color deseado
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 30, left: 15),
                        child: Text("REGISTRATE", style: TextStyle(fontSize: 30, fontFamily: "MartianMono", color: Colors.white),),
                      ),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 10, // Espacio horizontal entre elementos
                        runSpacing: 20, // Espacio vertical entre filas de elementos
                        children: label.map((item) => buildItem(item)).toList(),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(top: 50, bottom: 50),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: ElevatedButton(
                            onPressed: () {
                              onPressed: _postForm;
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(15),
                                backgroundColor: orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                            child: const Text("REGISTRARME", style: TextStyle(fontFamily: "Raleway", fontSize: 21)),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 40, right: 50),
                          padding: EdgeInsets.only(right: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/img/letrasMABLAnaranja.png", width: 225),
                              Container(
                                padding: EdgeInsets.only(top: 20, right: 30),
                                child: Text("HABLA CON LAS MANOS", style: TextStyle(fontFamily: "MartianMono", fontSize: 22, color: orange), textAlign: TextAlign.center,),
                              )
                            ],
                          )
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }

  Widget buildItem(String item) {
    return Container(
      width: 169,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10),
            child: Text(
              item,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Raleway",
                  fontSize: 19
              ),
            ),
          ),
          Container(
              height: 30,
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  color: beige,
                  borderRadius: BorderRadius.circular(100)
              ),
              child: TextFormField(
                cursorColor: Colors.black,
                obscureText: _obscureText,
                controller: _apellido,
                validator: (value) {
                  if (value!.isEmpty) {

                  }
                  return null;
                },
                style: TextStyle(
                  color: Colors.black, // Cambia este valor al color deseado
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              )
          )
        ],
      )
    );
  }

}