import 'package:mabla/quiz/pregunta.dart';

class Quiz {
  String name;
  List<Question> questions;
  int right = 0;

  Quiz(this.name, this.questions, this.right);

  double get parcent => (right/questions.length)*100; //porcentaje de preguntas correctas de este quiz
}