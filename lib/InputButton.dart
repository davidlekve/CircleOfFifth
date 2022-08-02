import 'package:circle_of_fifths/providers/input_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputButton extends StatelessWidget {
  const InputButton({Key? key, required this.text, required this.active, required this.onPressed}) : super(key: key);
  final String text;
  final bool active;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Expanded(child: TextButton(onPressed: onPressed,
    child: Text(text),
    style: TextButton.styleFrom(side: active?BorderSide(color: Colors.grey, width: 1):BorderSide(color: Colors.white, width: 0)),
    ),);
  }
}
