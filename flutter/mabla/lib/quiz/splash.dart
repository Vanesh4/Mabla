import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mabla/quiz/quizUI.dart';
import 'package:mabla/quiz/quizUI2.dart';
class inicioSplash extends StatefulWidget {

  final String cat;
  inicioSplash({required this.cat});

  @override
  State<inicioSplash> createState() => _inicioSplashState();
}

class _inicioSplashState extends State<inicioSplash> {
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3),(){
      final random = Random();
      int numeroAleatorio = random.nextInt(2) + 1;
      print(numeroAleatorio);
      if (numeroAleatorio==1){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>quiz(cat: widget.cat)));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>quizTipoDos(cat: widget.cat)));
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Lottie.asset('assets/img/Animation321.json'),
        ),
      ),
    );
  }
}


