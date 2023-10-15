import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mabla/quiz/resultadosQuiz.dart';

import 'data/questions.dart';
import 'data/quizclass.dart';


const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);

class quizTipoDos extends StatefulWidget {
  const quizTipoDos({Key? key}) : super(key: key);

  @override
  State<quizTipoDos> createState() => _quizTipoDosState();
}

class _quizTipoDosState extends State<quizTipoDos> {

  int totalQuestions = 5;
  int totalOptions = 4;
  int questionIndex = 0;
  int progressIndex = 0;
  Quiz quiz = Quiz(questions: []);
  Future<void> readData()async {
    int tipo = 2;
    String categoria = 'Verbos';
    final response = await http.get(
        Uri.parse('http://192.168.1.8/preguntas/$tipo/$categoria'));
    if (response.statusCode == 200) {
      final List<dynamic> data = await json.decode(response.body); //decodificar y pasar a una lista
      //data va a ser una sola preguna
      print("data quiz connected successfull");
      print(data);
      List<int> optionList = List<int>.generate(data.length, (i) => i);
      List<int> questionsAdded = []; //agregar los indixes de la pregunta para que no se repita

      while(true){
        //optionList tiene el indixes de las preguntas
        optionList.shuffle();
        int answer = optionList[0];

        if (questionsAdded.contains(answer)) continue;
        questionsAdded.add((answer));

        List<String> otherOptions = [];
        final getPalabras = await http.get(Uri.parse('http://192.168.1.8/getpalabra'));
        if (getPalabras.statusCode == 200) {
          final List<dynamic> data = json.decode(getPalabras.body);

          data.shuffle();
          for (int i = 0; i < 25; i++) {
            otherOptions.add(data[i]['Senia']);
          }

        } else {
          print("no se pudo traer señas de respuestas incorrectas");
        }
        //print(otherOptions);

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

  List<Color> containerColors = [
    purple,
    lightBlue,
    darkBlue,
    orange,
  ];

  @override
  void initState() {
    super.initState();

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
                  Text("A que seña corresponde esta palabra"),
                  Text(quiz.questions[questionIndex].question),

                  //RESPUESTAS
                  Flexible(
                    child: ListView.builder(
                      itemCount: totalOptions,
                      //shrinkWrap: true,
                      itemBuilder: (_, index){
                        Color currentColor = containerColors[index];
                        return Container(
                          //estilos a la respuesta
                          height: 160,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(5),
                            color: currentColor,
                            child: GestureDetector(
                              onTap: () {
                                _opcionSelected(quiz.questions[questionIndex].options[index]);
                              },
                              child: Image.network(quiz.questions[questionIndex].options[index]),
                            )
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



