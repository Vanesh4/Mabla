import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _clave = TextEditingController();
  final TextEditingController _confirmClave = TextEditingController();

  bool _obscureText = true;
  bool _obscureText1 = true;

  Future<void> _postForm() async {
      if (_clave.text == _confirmClave.text) {
        print(_alias.text);
        print(_nombre.text);
        print( _apellido.text);
        print( _email.text);
        print(_clave.text);
        print(_confirmClave.text);

        final String apiUrl = 'http://10.190.82.231/register';

        final Map<String, dynamic> requestBody = {
          'username': _alias.text,
          'first_name': _nombre.text,
          'last_name': _apellido.text,
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
  List<String> label = ['Nombre', 'Apellido', 'Correo electrónico', 'Usuario (Alias)', 'Clave', 'Confirma tu clave'];

  late final List<TextEditingController> controladores;

  @override
  void initState() {
    super.initState();
    controladores = [
      _nombre,
      _apellido,
      _email,
      _alias,
      _clave,
      _confirmClave,
    ];
  }

  @override
  void dispose() {
    for (var controller in controladores) {
      controller.dispose();
    }
    super.dispose();
  }

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
              height: 839,
              // Cambia "Colors.red" por el color deseado
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 40),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 30, top: 25, left: 15),
                        child: Text("REGISTRATE", style: TextStyle(fontSize: 32, fontFamily: "MartianMono", color: Colors.white),),
                      ),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 10, // Espacio horizontal entre elementos
                        runSpacing: 20, // Espacio vertical entre filas de elementos
                        children: //label.map((item) => buildItem(item,controladores)).toList(),
                        label.asMap().entries.map((entry) {
                          int index = entry.key;
                          String item = entry.value;
                          TextEditingController controller = controladores[index];
                          return buildItem(item, controller);
                        }).toList(),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(top: 50, bottom: 50, right: 20),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: ElevatedButton(
                            onPressed: () {
                              _postForm();
                              print(_alias.text);
                              print(_clave.text);
                              print(_confirmClave.text);
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(15),
                                backgroundColor: orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                            child: const Text("REGISTRARME", style: TextStyle(fontFamily: "Raleway", fontSize: 21)),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 30),
                          padding: EdgeInsets.only(left: 15, right: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/img/letrasMABLAnaranja.png", width: 220),
                              Container(
                                padding: EdgeInsets.only(top: 20, right: 45),
                                child: Text("HABLA CON LAS MANOS", style: TextStyle(fontFamily: "MartianMono", fontSize: 20, color: orange), textAlign: TextAlign.center,),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 30),
                                  width: 172,
                                  child: Image.asset("assets/img/capiLogin.png")
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

  Widget buildItem(String item, TextEditingController control) {

    bool isClave = control == _clave;
    bool isConfirmClave = control == _confirmClave;
    bool hasSuffixIcon = isClave || isConfirmClave;
    bool obscureText = isClave ? _obscureText : isConfirmClave ? _obscureText1 : false;
    double fontSize = control == _email ? 18.2 : isConfirmClave ? 19.4: 22.0 ;
    double padding = control == _email ? 3 : isConfirmClave ? 5: 10 ;
    double margin = control == _email ? 6 : isConfirmClave ? 3: 0 ;

    return Container(
      margin: EdgeInsets.only(left: 10, right: 3),
      width: 165,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: padding, top: margin),
            child: Text(
              item,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Raleway",
                  fontSize: fontSize
              ),
            ),
          ),
            Container(
                  height: 30,
                  padding: EdgeInsets.only(left: 15),
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: beige,
                      borderRadius: BorderRadius.circular(100)
                  ),

                  child: TextFormField(
                    cursorColor: Colors.black,
                    obscureText: obscureText,
                    controller: control,
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
                      suffixIcon: hasSuffixIcon ?  IconButton(
                        onPressed: () {
                          setState(() {
                            if (isClave) {
                              _obscureText = !_obscureText;
                            } else if (isConfirmClave) {
                              _obscureText1 = !_obscureText1;
                            }
                          });
                        },
                        icon: Icon(
                          _obscureText ? Icons.visibility :  _obscureText1 ? Icons.visibility : Icons.visibility_off, color: Colors.black,
                        ),
                      ):null,
                    ),
                  )
              )
        ],
      )
    );
  }

}