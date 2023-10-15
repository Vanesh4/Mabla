class Question {
  late String question;
  //String question = "Capital de: ";
  late String answer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

  Question.fromJson(Map<String, dynamic> json)
      : question = json['pregunta'],
        answer = json['respuesta'];

  void addOptions(List<String> newOptions) {
    //question += country;
    question;
    options.add(answer);
    for (int i = 0; i < newOptions.length; i++) {
      if (i == 3) break;
      options.add(newOptions[i]);
    }

    //options.addAll(newOptions);
    options.shuffle(); //para que se mezclen y lleguen al tile aleatoreamente
    //print(options);
  }

  @override
  String toString() {
    return 'Question{question: $question, answer: $answer, options: $options}';
  }
}