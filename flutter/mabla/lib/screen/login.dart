import 'dart:convert';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
  bool _obscureText = true;
  bool _isNull = false;
  @override
  void singIn(BuildContext context) {
    // confetti.fire();
    if (_formKey.currentState!.validate()) {
      // Navigate & hide confetti
      Future.delayed(const Duration(milliseconds: 200), () {
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
              child: Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/img/picoLogin-01.svg',
                        colorFilter: ColorFilter.mode(purple, BlendMode.srcIn),
                        width: double.infinity,
                        height: 658,
                            // Cambia "Colors.red" por el color deseado
                          ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                            //padding: const EdgeInsets.only(top: 30, left: 30, right: 5),
                            child: Column(
                                children:[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15, top: 15, left: 15),
                                    child: Text("INICIA SESIÓN", style: TextStyle(fontSize: 30, fontFamily: "MartianMono", color: Colors.white),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
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
                                                  margin: EdgeInsets.only(left: 15),
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "Alias",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Raleway",
                                                        fontSize: 20
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 20),
                                                  child: TextFormField(
                                                    cursorColor: Colors.white,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                      }
                                                      return null;
                                                    },
                                                    style: TextStyle(
                                                      color: Colors.white, // Cambia este valor al color deseado
                                                    ),
                                                    decoration: InputDecoration(
                                                      enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                      ),
                                                      focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: 15),
                                                  alignment: Alignment.centerLeft,
                                                  child: const Text(
                                                    "Clave",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Raleway",
                                                        fontSize: 20
                                                    ),
                                                  ),
                                                ),
                                                TextFormField(
                                                  cursorColor: Colors.white,
                                                  obscureText: _obscureText,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                    }
                                                    return null;
                                                  },
                                                  style: TextStyle(
                                                    color: Colors.white, // Cambia este valor al color deseado
                                                  ),
                                                  decoration: InputDecoration(
                                                    enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                    ),
                                                    focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                    ),
                                                    suffixIcon: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _obscureText = !_obscureText;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        _obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.symmetric(vertical: 24, horizontal: 30),
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
                                                                fontSize: 16
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
                                                                fontSize: 16
                                                            ),
                                                          ),
                                                        )
                                                    ),
                                                  ]
                                              )
                                          ),
                                          Container(
                                            alignment: Alignment.bottomRight,
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                singIn(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color.fromRGBO(255, 115, 28, 9),
                                                minimumSize: const Size(200, 50),
                                                shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(25),
                                                    bottomRight: Radius.circular(25),
                                                    bottomLeft: Radius.circular(25),
                                                  ),
                                                ),
                                              ),
                                              icon: const Icon(
                                                CupertinoIcons.arrow_right,
                                                color: Color.fromRGBO(255, 205, 163, 9),
                                              ),
                                              label: const Text("INGRESAR", style: TextStyle(fontFamily: "Raleway", fontSize: 25)),
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
                              margin: EdgeInsets.only(top: 15, right: 50),
                              padding: EdgeInsets.only(left: 10, right: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/img/letrasMABLAnaranja.png", width: 230),
                                  Container(
                                    padding: EdgeInsets.only(top: 20, right: 45),
                                    child: Text("HABLA CON LAS MANOS", style: TextStyle(fontFamily: "MartianMono", fontSize: 23, color: orange), textAlign: TextAlign.center,),
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
class registro extends StatefulWidget {
  const registro({super.key});

  @override
  State<registro> createState() => _registroState();
}

class _registroState extends State<registro> {
  final _alias= TextEditingController();
  final _nombre= TextEditingController();
  final _apellido= TextEditingController();
  final _telefono= TextEditingController();
  final _correo= TextEditingController();
  final _clave = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  List<dynamic> datos=[];
  Future<void> consultaDatos(body) async{
    final url=Uri.parse('http://192.168.0.9/insertUser');
    final response = await http.post((url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      print('Dato enviado exitosamente a Django, datos: '+body);
    } else {
      print('Error al enviar el dato a Django. Código de estado: ${response.statusCode}'+body);
    }
  }

  @override
  void singIn(BuildContext context) {
    // confetti.fire();
    if (_formKey.currentState!.validate()) {
      final body = json.encode({
        "alias":_alias.text,
        "nombre":_nombre.text,
        "apellido":_apellido.text,
        "telefono":int.parse(_telefono.text),
        "correo":_correo.text,
        "clave":_clave.text,
      });
      consultaDatos(body);
      // Navigate & hide confetti
      Future.delayed(const Duration(milliseconds: 200), () {
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:
                  Stack(
                    children: [
                      SvgPicture.asset(
                              'assets/img/pico.svg',
                              width: double.infinity,
                              height: 840,
                              colorFilter: ColorFilter.mode(purple, BlendMode.srcIn)
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 40, left: 20, right: 15),
                        child: Column(
                            children:[
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(bottom: 40, left: 15),
                                child: Text("REGISTRATE", style: TextStyle(fontSize: 30, fontFamily: "MartianMono", color: Colors.white),),
                              ),
                              Column(
                                children: [
                                  Form(
                                      key: _formKey,
                                      child: Column(
                                          children: [
                                            Row(
                                                children:[
                                                  Expanded(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment.centerLeft,
                                                            margin: EdgeInsets.only(left: 10),
                                                            child: const Text(
                                                              "Nombre",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontFamily: "Raleway",
                                                                  fontSize: 19
                                                              ),
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            cursorColor: Colors.white,
                                                            controller: _nombre,
                                                            validator: (value) {
                                                              if (value!.isEmpty) {

                                                              }
                                                              return null;
                                                            },
                                                            style: TextStyle(
                                                              color: Colors.white, // Cambia este valor al color deseado
                                                            ),
                                                            decoration: InputDecoration(
                                                              enabledBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                              ),
                                                              focusedBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment.centerLeft,
                                                            margin: EdgeInsets.only(left: 10),
                                                            child: const Text(
                                                              "Apellido",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontFamily: "Raleway",
                                                                  fontSize: 19
                                                              ),
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            cursorColor: Colors.white,
                                                            controller: _apellido,
                                                            validator: (value) {
                                                              if (value!.isEmpty) {

                                                              }
                                                              return null;
                                                            },
                                                            style: TextStyle(
                                                              color: Colors.white, // Cambia este valor al color deseado
                                                            ),
                                                            decoration: InputDecoration(
                                                              enabledBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                              ),
                                                              focusedBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                  ),
                                                ]
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 30),
                                              child: Row(
                                                  children:[
                                                    Expanded(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              alignment: Alignment.centerLeft,
                                                              margin: EdgeInsets.only(top: 20, left: 5),
                                                              child: const Text(
                                                                "Teléfono",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontFamily: "Raleway",
                                                                    fontSize: 19
                                                                ),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              cursorColor: Colors.white,
                                                              controller: _telefono,
                                                              validator: (value) {
                                                                if (value!.isEmpty) {

                                                                }
                                                                return null;
                                                              },
                                                              style: TextStyle(
                                                                color: Colors.white, // Cambia este valor al color deseado
                                                              ),
                                                              decoration: InputDecoration(
                                                                enabledBorder: UnderlineInputBorder(
                                                                  borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                ),
                                                                focusedBorder: UnderlineInputBorder(
                                                                  borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              alignment: Alignment.centerLeft,
                                                              margin: EdgeInsets.only(top: 20, left: 10),
                                                              child: const Text(
                                                                "Correo electrónico",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontFamily: "Raleway",
                                                                    fontSize: 18
                                                                ),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              cursorColor: Colors.white,
                                                              controller: _correo,
                                                              validator: (value) {
                                                                if (value!.isEmpty) {

                                                                }
                                                                else if(!value.contains("@")){
                                                                  return "Correo no válido";
                                                                }
                                                                return null;
                                                              },
                                                              style: TextStyle(
                                                                color: Colors.white, // Cambia este valor al color deseado
                                                              ),
                                                              decoration: InputDecoration(
                                                                enabledBorder: UnderlineInputBorder(
                                                                  borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                ),
                                                                focusedBorder: UnderlineInputBorder(
                                                                  borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                    )
                                                  ]
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 20),
                                              child:
                                              Row(
                                                  children:[
                                                    Expanded(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              alignment: Alignment.centerLeft,
                                                              margin: EdgeInsets.only(left: 10),
                                                              child: const Text(
                                                                "Nombre de usuario (Alias)",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontFamily: "Raleway",
                                                                    fontSize: 18
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                                margin: EdgeInsets.only(left: 20),
                                                                child: TextFormField(
                                                                  style: TextStyle(
                                                                    color: Colors.white, // Cambia este valor al color deseado
                                                                  ),
                                                                  cursorColor: Colors.white,
                                                                  controller: _alias,
                                                                  validator: (value) {
                                                                    if (value!.isEmpty) {

                                                                    }
                                                                    return null;
                                                                  },
                                                                  decoration: InputDecoration(
                                                                    enabledBorder: UnderlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                    ),
                                                                    focusedBorder: UnderlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                    ),
                                                                  ),
                                                                )
                                                            )
                                                          ],
                                                        )
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              alignment: Alignment.centerLeft,
                                                              margin: EdgeInsets.only(left: 10, top: 20),
                                                              child: const Text(
                                                                "Clave",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontFamily: "Raleway",
                                                                    fontSize: 19
                                                                ),
                                                              ),
                                                            ),
                                                            TextFormField(
                                                              cursorColor: Colors.white,
                                                              obscureText: _obscureText,
                                                              controller: _clave,
                                                              validator: (value) {
                                                                if (value!.isEmpty) {

                                                                }
                                                                else if(value.length<8){
                                                                  return "Ingrese 8 caracteres o más";
                                                                }
                                                                return null;
                                                              },
                                                              decoration: InputDecoration(
                                                                enabledBorder: UnderlineInputBorder(
                                                                  borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                ),
                                                                focusedBorder: UnderlineInputBorder(
                                                                  borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                ),
                                                                suffixIcon: IconButton(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      _obscureText = !_obscureText;
                                                                    });
                                                                  },
                                                                  icon: Icon(
                                                                    _obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.white,
                                                                  ),
                                                                ),
                                                              ),
                                                              style: TextStyle(
                                                                color: Colors.white, // Cambia este valor al color deseado
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                    )
                                                  ]
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.bottomRight,
                                              margin: EdgeInsets.only(top: 50, bottom: 50),
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    singIn(context);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: const Color.fromRGBO(255, 115, 28, 9),
                                                    minimumSize: const Size(200, 56),
                                                    shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(10),
                                                        topRight: Radius.circular(25),
                                                        bottomRight: Radius.circular(25),
                                                        bottomLeft: Radius.circular(25),
                                                      ),
                                                    ),
                                                  ),
                                                  icon: const Icon(
                                                    CupertinoIcons.arrow_right,
                                                    color: Color.fromRGBO(255, 205, 163, 9),
                                                  ),
                                                  label: const Text("REGISTRARME", style: TextStyle(fontFamily: "Raleway", fontSize: 21)),
                                                ),
                                              ),
                                            )
                                          ])
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
                              )
                            ]

                        ),
                      ),
                    ],
                  ),
    )
    );
  }
}

/*
void loginContent(BuildContext context, {required ValueChanged onValue}){
  showGeneralDialog(context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
      return Center(
        child: SingleChildScrollView(
          child: Container(
            height: 720,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(116, 199, 184, 9),
              borderRadius: BorderRadius.circular(40),
            ),
            child: login(),
          ),
        ),
      );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
    // if (anim.status == AnimationStatus.reverse) {
    //   tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
    // } else {
    //   tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
    // }

    tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

    return SlideTransition(
      position: tween.animate(
        CurvedAnimation(parent: anim, curve: Curves.easeInOut),
      ),
      // child: FadeTransition(
      //   opacity: anim,
      //   child: child,
      // ),
      child: child,
    );
  },
  ).then(onValue);
}
*/

