import 'dart:math';

import 'package:circle_of_fifths/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircleItem extends StatelessWidget {
  CircleItem({Key? key, required this.letter, required this.size, required this.active}) : super(key: key);

  final int size;
  final String letter;
  final bool active;
  Random r = Random();


  @override
  Widget build(BuildContext context) {
    int visibleChance=context.select<SettingsProvider,int>((value) => value.visibility);
    bool  visible= r.nextDouble() < visibleChance/100;
    return SizedBox(
      height: size.toDouble(),
      width: size.toDouble(),
      child: Container(
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: active?const BorderSide(
              color: Colors.red,
              width: 2,
            ):const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          color: const Color(0xFFDEDEDE),
        ),
        child: Center(
          child: active || !visible?null:Text(letter),
        ),
      )
    );
  }
}
