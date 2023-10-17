import 'package:flutter/material.dart';
import 'package:mabla/home.dart';
import 'package:mabla/screen/consultar.dart';
const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);

class resultadosQuiz extends StatefulWidget {


  final String message;
  resultadosQuiz({required this.message});
  @override
  State<resultadosQuiz> createState() => _resultadosQuizState();
}

class _resultadosQuizState extends State<resultadosQuiz> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('tu puntaje:',
              style: TextStyle(fontSize: 40, fontFamily: "Raleway",color: Colors.black),),
            SizedBox(height: 20,),
            Text(widget.message+'/5',
              style: TextStyle(fontSize: 55, fontFamily: "MartianMonoBold",color: Colors.black,
                )),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
              },
              child: Text('Volver al inicio',
                style: TextStyle(fontSize: 28, fontFamily: "Raleway",color: Colors.black),),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(purple),
                  shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  )
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>consultar()));
              },
              child: Text('Seguir Aprendiendo',
                style: TextStyle(fontSize: 28, fontFamily: "Raleway",color: Colors.black),),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(lightBlue),
                  shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  )
              ),
            ),
            SizedBox(height: 30,),
            Image.asset('assets/img/capiJugito.png', width: 300,)
          ],
        ),
      ),
    );
  }
}
