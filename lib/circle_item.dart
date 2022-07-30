import 'package:flutter/material.dart';

class CircleItem extends StatelessWidget {
  const CircleItem({Key? key, required this.letter, required this.size, required this.color}) : super(key: key);

  final int size;
  final String letter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.toDouble(),
      width: size.toDouble(),
      child: Container(
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: color,
        ),
        child: Center(
          child: Text(letter),
        ),
      )
    );
  }
}
