import 'package:mabla/quiz/data/questions.dart';

class Quiz {
  //String name;
  List<Question> questions;
  int right = 0;

  //Quiz({required this.name, required this.questions});
  Quiz({required this.questions});

  @override
  String toString() {
    return 'Quiz{questions: $questions}';
  }
//para devolver el porcetanje de las que estan correctas
//double get percent => (right / questions.length) * 100;


}