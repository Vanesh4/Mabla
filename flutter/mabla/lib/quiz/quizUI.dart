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
    String categoria = 'sustantivos';
    final response = await http.get(Uri.parse('http://192.168.1.10/preguntas/$tipo/$categoria'));
    if (response.statusCode == 200) {
      final List<dynamic> data = await json.decode(response.body); //decodificar y pasar a una lista
      //data va a ser una sola preguna
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

  @override
  void initState() {
    super.initState();
    //funcion que carge las preguntas
    readData();
  }

  String message = 'Hola desde SenderWidget';
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => resultadosQuiz(message: message),
        ),
      );
    }
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                color: Colors.amber.shade900,
                value: progressIndex / totalQuestions,
                minHeight: 20,
              ),
            ),

            //Pregunta y respuetas
            Expanded(
              //ConstrainedBox
              //constraints: const BoxConstraints(maxHeight: 450),
              child: Container(
                child: quiz.questions.isNotEmpty
                    ? Card(
                    child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: //Image.asset('assets/img/ninja.png'),
                        //Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa6pwb9P16lp30bS-sLM4rn0q_b-w0f_2QLg&usqp=CAU')
                        Image.network(quiz.questions[questionIndex].country)
                      ),
                      //RESPUESTAS
                      Flexible(
                        child: ListView.builder(
                          itemCount: totalOptions,
                          //shrinkWrap: true,
                          itemBuilder: (_, index){
                            return Container(
                              //estilos a la respuesta
                              margin: EdgeInsets.all(5),
                              color: Colors.purple,
                              child: ListTile(
                                //el listado del index
                                //title: Text('Respuesta ${index+1}'),
                                title: Text(quiz.questions[questionIndex].options[index]),
                                onTap: (){
                                  _opcionSelected(quiz.questions[questionIndex].options[index]);
                                },
                                // Estilizar el efecto de pulsación. no sirve
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Ajusta el radio según tu preferencia
                                  side: BorderSide(
                                    color: Colors.blue, // Color del borde
                                    width: 2.0, // Ancho del borde
                                  ),
                                ),
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
    );

  }
}
