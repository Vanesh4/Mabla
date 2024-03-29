import 'package:flutter/material.dart';
import 'package:mabla/screen/diccionario.dart';
import 'package:mabla/screen/menu.dart';
import 'package:mabla/usuario/login.dart';
import 'package:mabla/usuario/registro.dart';
import 'home.dart';
class headerPrincipal extends StatefulWidget {
  const headerPrincipal({Key? key}) : super(key: key);

  @override
  State<headerPrincipal> createState() => _headerPrincipalState();
}

const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);

class _headerPrincipalState extends State<headerPrincipal> {
  String initial = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 90),
      color: beige,
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>home())),
                    child: Image.asset('assets/img/Megalogo.png', width: 130,)),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>menu()));
                    },
                        child: Text('Contenido',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Raleway',
                              color: Colors.black
                          ),
                        )
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){},
                        child: Text('Sobre Nosotros',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Raleway',
                              color: Colors.black
                          ),
                        )
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black, width: 2
                      ),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        initial = value;
                        print(initial);
                      });
                    },
                    onFieldSubmitted: (text) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>diccionario(letraDesdeHeader: text)));
                    },
                    style: const TextStyle(
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search_rounded,
                          size: 30,
                          color: Colors.black,)
                    ),

                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 30, right: 30),
                  height: 48,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>registro()));
                  },
                    child: Text('Registrarme',
                      style: TextStyle(fontSize: 28, fontFamily: "Raleway",color: Colors.white),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(darkBlue),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            )
                        )
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 30, right: 30),
                  height: 48,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                  },
                    child: Text('Iniciar Sesión',
                      style: TextStyle(fontSize: 27, fontFamily: "Raleway",color: Colors.white),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(lightBlue),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            )
                        )
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
