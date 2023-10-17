import 'dart:convert';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mabla/usuario/registro.dart';
import 'package:shared_preferences/shared_preferences.dart';


const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}


class _loginState extends State<login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isNull = false;

  Future<void> singIn() async{
    // confetti.fire();
    if (_formKey.currentState!.validate()) {
      if (_formKey.currentState!.validate()) {
        Future.delayed(const Duration(milliseconds: 200), () async {

          final String apiUrl = 'http://192.168.0.7/api/token/';
          final Map<String, dynamic> requestBody = {
            'username': _usernameController.text,
            'password': _passwordController.text,
          };
          try{
            final response = await http.post(
              Uri.parse(apiUrl),
              headers: {'Content-Type': 'application/json'},
              body: json.encode(requestBody),
            );
            if (response.statusCode == 200) {
              final responseData = json.decode(response.body);
              final token = responseData['access'];
              final mensaje = responseData['error'];
              final prefs = await SharedPreferences.getInstance();
              print('Este es el token');
              print(prefs);
              prefs.setString('jwt_token', token);
              print("error $mensaje");
              print('Token JWT almacenado: $token');
              print('Respuesta JSON completa: $responseData');
              // Redirigir automáticamente al perfil del cliente
              Navigator.pushReplacementNamed(context, '/perfil');
            } else {
              final errorMessage = json.decode(response.body)['detail'];
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Error al iniciar sesión'),
                    content: Text(errorMessage),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Aceptar'),
                      ),
                    ],
                  );
                },
              );
            }
          }
          catch (e) {
            // Manejar errores de red o excepciones aquí
            print('Error de red: $e');
          }
          // Navigator.pop(context);
          /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EntryPoint(),
          ),
        );*/
        });
      }
    }
  }
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
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                    //padding: const EdgeInsets.only(top: 30, left: 30, right: 5),
                    child: Column(
                        children:[
                          Container(
                            margin: EdgeInsets.only(bottom: 15, top: 15, left: 15),
                            child: Text("INICIA SESIÓN", style: TextStyle(fontSize: 32, fontFamily: "MartianMono", color: Colors.white),),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            padding: EdgeInsets.only(left: 20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 50, right: 50),
                                    child: Column(
                                      children: [
                                        Container(
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  margin: EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "Alias",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Raleway",
                                                        fontSize: 25
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    height: 37,
                                                    margin: EdgeInsets.only(top: 15),
                                                    padding: EdgeInsets.only(left: 15, bottom: 5),
                                                    decoration: BoxDecoration(
                                                        color: beige,
                                                        borderRadius: BorderRadius.circular(100)
                                                    ),
                                                    child: TextFormField(
                                                      cursorColor: Colors.black,
                                                      controller: _usernameController,
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
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 20),
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  margin: EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "Clave",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Raleway",
                                                        fontSize: 25
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    height: 37,
                                                    margin: EdgeInsets.only(top: 15),
                                                    padding: EdgeInsets.only(left: 15, bottom: 5),
                                                    decoration: BoxDecoration(
                                                        color: beige,
                                                        borderRadius: BorderRadius.circular(100)
                                                    ),
                                                    child: TextFormField(
                                                        cursorColor: Colors.black,
                                                        obscureText: _obscureText,
                                                        controller: _passwordController,
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
                                                          suffixIcon: IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                _obscureText = !_obscureText;
                                                              });
                                                            },
                                                            icon: Icon(
                                                              _obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.black,
                                                            ),
                                                          ),
                                                        )
                                                    )
                                                )
                                              ],
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(vertical: 45, horizontal: 28),
                                      child: Column(
                                          children:[
                                            GestureDetector(
                                                onTap: () {
                                                  registro();
                                                },
                                                child: Container(
                                                  alignment: Alignment.bottomRight,
                                                  child: Text(
                                                    "Olvidaste tu contraseña?",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Raleway",
                                                        fontSize: 19
                                                    ),
                                                  ),
                                                )
                                            ),
                                            SizedBox(
                                              child: Padding(
                                                padding: EdgeInsets.only(bottom: 5),
                                              ),
                                            ),
                                            GestureDetector(
                                                onTap: (){
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const registro()),
                                                  );
                                                },
                                                child: Container(
                                                  alignment: Alignment.bottomRight,
                                                  child: Text(
                                                    "Registrarme",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Raleway",
                                                        fontSize: 19
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ]
                                      )
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(top: 5, bottom: 20),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        singIn();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                          backgroundColor: orange,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                          )
                                      ),
                                      child: const Text("INGRESAR", style: TextStyle(fontFamily: "Raleway", fontSize: 25)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ]
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 23, right: 50),
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
              )
            ],
          ),
        )
    );
  }
}