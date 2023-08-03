import 'package:flutter/material.dart';

const Color darkBlue = Color(0xFF0a4d68);
const Color lightBlue = Color(0xFF06bfdb);
const Color purple = Color(0xFF76037a);
const Color orange = Color(0xFFff731c);
const Color beige = Color(0xFFfff7ea);

class abecedario extends StatelessWidget {
  const abecedario({super.key});
  @override
  Widget build(BuildContext context) {

    List<String> letra = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'Ñ', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      color: Colors.purple,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: SingleChildScrollView(
        child:  Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 50, // Espacio horizontal entre elementos
          runSpacing: 20, // Espacio vertical entre filas de elementos
          children: letra.map((item) => buildItem(item)).toList(),
        ),
      )
    );
  }
}
Widget buildItem(String item) {
  return Text(
      item, style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: "Raleway"),
  );
}
