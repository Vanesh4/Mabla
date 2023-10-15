import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mabla/quiz/data/quizclass.dart';
import 'package:mabla/quiz/resultadosQuiz.dart';


import 'data/questions.dart';

const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);

class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  int totalQuestions = 5;
  int totalOptions = 4;
  int questionIndex = 0;
  int progressIndex = 0;
  Quiz quiz = Quiz(questions: []);
  Future<void> readData()async{
    int tipo = 1;
    String categoria = 'Sustantivos';
    final response = await http.get(Uri.parse('http://192.168.1.8/preguntas/$tipo/$categoria'));
    if (response.statusCode == 200) {
      final List<dynamic> data = await json.decode(response.body); //decodificar y pasar a una lista
      //data va a ser una sola preguna
      print("data quiz connected successfull");
      List<int> optionList = List<int>.generate(data.length, (i) => i);
      List<int> questionsAdded = []; //agregar los indixes de la pregunta para que no se repita

      while(true){
        //optionList tiene el indixes de las preguntas
        optionList.shuffle();
        int answer = optionList[0];

        if (questionsAdded.contains(answer)) continue;
        questionsAdded.add((answer));

        List<String> otherOptions = ["vaca","tren","pajaro","hospital","foca","moto","colegio","bus","gato","camiseta","falda","medias","pera","banano","chaqueta","nutria","vestido","fresas","papaya"];

        Question question = Question.fromJson(data[answer]);
        otherOptions.shuffle();
        question.addOptions(otherOptions);
        quiz.questions.add(question);

        if (quiz.questions.length >= totalQuestions) break;
      }
      setState(() {});

    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  }

  //colores del contenedor:
  List<Color> containerColors = [
    purple,
    lightBlue,
    darkBlue,
    orange,
  ];
  List<Color> textColors = [
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
  ];

  @override
  void initState() {
    super.initState();
    //funcion que carge las preguntas
    readData();
  }


  void _opcionSelected(String sel){
    quiz.questions[questionIndex].selected = sel;
    if (sel == quiz.questions[questionIndex].answer){
      quiz.questions[questionIndex].correct = true;
      quiz.right +=1;
    }
    else{
      print("InCORRECTO");
    }
    progressIndex++;
    if(questionIndex < totalQuestions-1){
      questionIndex++;
    }else{
      String totalResult = quiz.right.toString();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => resultadosQuiz(message: totalResult),
        ),
      );
    }
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text('A que palabra corresponde esta seña',
                style: TextStyle(fontSize: 30, fontFamily: "Raleway",color: Colors.black),textAlign: TextAlign.center,),

              Container(
                height: 8,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: LinearProgressIndicator(
                    color: beige,
                    value: progressIndex / totalQuestions,
                    minHeight: 20,
                  ),
                ),
              ),

              //Pregunta y respuetas
              Expanded(
                //ConstrainedBox
                //constraints: const BoxConstraints(maxHeight: 450),
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: quiz.questions.isNotEmpty
                      ? Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                        elevation: 0.0,
                      child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          child: //Image.asset('assets/img/ninja.png'),
                          //Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa6pwb9P16lp30bS-sLM4rn0q_b-w0f_2QLg&usqp=CAU')
                          Image.network(quiz.questions[questionIndex].question),
                          height: 300,
                        ),
                        //RESPUESTAS
                        Flexible(
                          child: ListView.builder(
                            itemCount: totalOptions,
                            //shrinkWrap: true,
                            itemBuilder: (_, index){
                              Color currentColor = containerColors[index];
                              Color currentTextColor = textColors[index];
                              return Container(
                                //estilos a la respuesta
                                margin: EdgeInsets.all(5),
                                color: currentColor,
                                child: ListTile(
                                  //el listado del index
                                  //title: Text('Respuesta ${index+1}'),
                                  title: Text(quiz.questions[questionIndex].options[index],
                                  style: TextStyle(fontSize: 30, fontFamily: "Raleway",color: currentTextColor)
                                    ,textAlign: TextAlign.center,),
                                  onTap: (){
                                    _opcionSelected(quiz.questions[questionIndex].options[index]);
                                  },
                                  // *****Estilizar el efecto de pulsación.
                                ),
                              );
                            },
                          ),

                        )
                      ],
                    ),
                  ): const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5.0, // Ancho de la barra de progreso
                      backgroundColor: Colors.grey, // Color de fondo de la barra de progreso
                    ), // Barra de progreso circular
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
