import 'package:flutter/material.dart';

class 2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<TextEditingController> controllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller List Example'),
      ),
      body: Column(
        children: [
          for (var controller in controllerList)
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Enter text'),
            ),
          ElevatedButton(
            onPressed: () {
              // You can access the text in each controller like this:
              for (var controller in controllerList) {
                print(controller.text);
              }
            },
            child: Text('Print Text'),
          ),
          Column(
            children: label
                .map((item) => buildItem(item, controllerList))
                .toList(),
          ),
        ],
      ),
    );
  }
}

Widget buildItem(String item, List<TextEditingController> controllerList) {
  return Row(
    children: [
      Text(item),
      SizedBox(width: 10),
      for (var controller in controllerList)
        Flexible(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Enter text for $item'),
          ),
        ),
    ],
  );
}

List<String> label = ['A', 'B', 'C'];
