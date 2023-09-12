class Question {
  late String pregunta;
  String textoPreg = "A que palabra corresponde esta seña";
  late String respuesta;
  List<String> opciones = [];
  String seleccionado = "Skipped";
  bool correcto = false;

  Question.fromJson(Map<String, dynamic> json)
  :pregunta = json['pregunta'],
  respuesta = json['respuesta'];

  void addOptions(List<String> newOptions){
    //textoPreg += '$pregunta?';
    opciones.add(respuesta);
    opciones.addAll(newOptions);
    opciones.shuffle(); //las va a generar en orden diferente
  }

}