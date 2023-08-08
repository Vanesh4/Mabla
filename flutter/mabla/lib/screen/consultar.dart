import 'package:flutter/material.dart';

class consultar extends StatefulWidget {
  const consultar({Key? key}) : super(key: key);

  @override
  State<consultar> createState() => _consultarState();
}

class _consultarState extends State<consultar> {
  String dropdwoncurrentvalue="opcion1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        child: Container(
            color: Color(0xFF0a4d68),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(top: 40),
                child: Image.asset('assets/img/Megalogo.png'),
              ),
              const Text("MABLA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),

             DropdownButton(
                 items: <String>['opcion1', 'opcion2']
                     .map<dropdwoncurrentvalue<String>>((String value){
                   return DropdownMenuItem<String>(
                     value: value,
                     child: Text(value),
                   );
                 }).toList(),
                 value: dropdwoncurrentvalue,
                 style: TextStyle(color: Colors.black),
                 onChanged: (String valuein){
                   setState(() {
                     dropdwoncurrentvalue=valuein;
                   });
                 })

             /* Container(
              margin: const EdgeInsets.only(top:30),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: Colors.grey,
              child: Text("home"),
            ),
              Container(
                margin: const EdgeInsets.only(top:2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.grey,
                child: Text("home"),
              ),
              Container(
                margin: const EdgeInsets.only(top:2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.grey,
                child: Text("home"),
              ),
              Expanded(child:  Container()),
              Container(
                margin: const EdgeInsets.only(top:2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.black,
                alignment: Alignment.center,
                child: Text("home", style: TextStyle(color: Colors.white),),
              ),*/
            ],
          ),

        ),
      ),


      appBar: AppBar(
          backgroundColor: Color(0xFF0a4d68),
        title: const Text('Explora nuestro contenido'),
      ),
    );


  }
}

