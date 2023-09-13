class Question {
  late String country;
  //String question = "Capital de: ";
  late String answer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

  Question.fromJson(Map<String, dynamic> json)
      : country = json['respuesta'],
        answer = json['pregunta'];

  void addOptions(List<String> newOptions) {
    //question += country;
    country;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle(); //para que se mezclen y lleguen al tile aleatoreamente
  }
}