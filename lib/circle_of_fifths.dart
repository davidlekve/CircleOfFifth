import 'dart:math';

import 'package:circle_of_fifths/circle_item.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class CircleOfFifths extends StatelessWidget {
  CircleOfFifths({Key? key}) : super(key: key);

  ///
  /// Function will give coordinates to match with completing a circle with
  /// 12 elements
  ///
  Tuple2<double, double> calculateCoordinates(int index, radius) {
    const int numOfElements = 12;

    assert(numOfElements > index);

    const double radians = 2 * pi / numOfElements;

    return Tuple2(radius * cos(radians * index), radius * sin(radians * index));
  }

  ///
  /// Function that will take coordinates and turn in to position.
  /// [size] is the width and height of the parent square
  ///
  Tuple2<double, double> toPosition(
      Tuple2<double, double> coordinates, double size, double radius) {
    double left = coordinates.item1 + size / 2;
    double top = coordinates.item2 + size / 2;

    return Tuple2(left, top);
  }

  static const int outerSize = 50;
  static const int innerSize=40;
  static const int padding=25;

  static const List<String> outerLabels= ["A", "E", "B", "F#", "C#\nDb", "Ab", "Eb", "Bb", "F", "C","G","D"];
  static const List<String> innerLabels=["F#m", "C#m\nDbm", "Abm", "Ebm", "Bbm", "Fm", "Cm","Gm","Dm","Am", "Em", "Bm"];
  final List<Color> colors=[Colors.yellow.shade600, Colors.yellow,Colors.lightGreenAccent,Colors.green,Colors.cyan,Colors.blue.shade900,Colors.deepPurple.shade600,Colors.purple,Colors.pinkAccent,const Color(0xFFFF0000), Colors.deepOrange,Colors.orange,];

  @override
  Widget build(BuildContext context) {

    double size=MediaQuery.of(context).size.width;
    double outerRadius=size/2-outerSize/2-padding;
    double innerRadius=size/2-outerSize/2-innerSize-padding;


    return SizedBox(
      width: size,
      height: size,
      child: Stack(
          children: [...List.generate(
            12,
                (index) {
              Tuple2<double, double> coordinates = toPosition(
                  calculateCoordinates(index, outerRadius),
                  size,
                  outerRadius);
              double left = coordinates.item1;
              double top = coordinates.item2;
              return Positioned(
                left: left - outerSize / 2,
                top: top - outerSize / 2,
                child: CircleItem(
                  size: outerSize,
                  letter: outerLabels[index],
                  color: colors[index],
                ),
              );
            },
          ),
            ...List.generate(
              12,
                  (index) {
                Tuple2<double, double> coordinates = toPosition(
                    calculateCoordinates(index, innerRadius),
                    size,
                    innerRadius);
                double left = coordinates.item1;
                double top = coordinates.item2;
                return Positioned(
                  left: left - innerSize / 2,
                  top: top - innerSize / 2,
                  child: CircleItem(
                    size: innerSize,
                    letter: innerLabels[index],
                    color:colors[(index+3)%12],
                  ),
                );
              },
            ),
          ]),
    );
  }
}
