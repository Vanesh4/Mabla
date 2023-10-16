import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mabla/quiz/quizUI.dart';
class inicioSplash extends StatefulWidget {
  const inicioSplash({Key? key}) : super(key: key);

  @override
  State<inicioSplash> createState() => _inicioSplashState();
}

class _inicioSplashState extends State<inicioSplash> {
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>quiz()));
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
    );;
  }
}


