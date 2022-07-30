import 'package:circle_of_fifths/input_field.dart';
import 'package:flutter/material.dart';

import 'circle_of_fifths.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Circle of fifths"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleOfFifths(),
            InputField(),
          ]
        ),
      ),
    );
  }
}
