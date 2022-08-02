import 'dart:math';

import 'package:circle_of_fifths/circle_item.dart';
import 'package:circle_of_fifths/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:provider/provider.dart';
import 'providers/active_provider.dart';

class CircleOfFifths extends StatelessWidget {
  CircleOfFifths({Key? key}) : super(key: key);

  static const int outerSize = 50;
  static const int innerSize=40;
  static const int padding=25;
  static const int numOfElements = 12;

  late List<String> outerLabels;
  late List<String> innerLabels;

  // final List<Color> colors=[Colors.yellow.shade600, Colors.yellow,Colors.lightGreenAccent,Colors.green,Colors.cyan,Colors.blue.shade900,Colors.deepPurple.shade600,Colors.purple,Colors.pinkAccent,const Color(0xFFFF0000), Colors.deepOrange,Colors.orange,];


  ///
  /// Function will give coordinates to match with completing a circle with
  /// 12 elements
  ///
  Tuple2<double, double> calculateCoordinates(int index, radius) {

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

  @override
  Widget build(BuildContext context) {
    context.select<ActiveProvider, int>((activeProvider) => activeProvider.randomActive);
    int _visibility=context.watch<SettingsProvider>().visibility;

    double size=MediaQuery.of(context).size.width;
    double outerRadius=size/2-outerSize/2-padding;
    double innerRadius=size/2-outerSize/2-innerSize-padding;

    outerLabels=context.read<ActiveProvider>().notes.getRange(0,12).toList();
    innerLabels=context.read<ActiveProvider>().notes.getRange(12, 24).toList();

    int activeIndex=context.read<ActiveProvider>().randomActive;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
          children: [...List.generate(
            numOfElements,
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
                  active: index==activeIndex?true:false,
                ),
              );
            },
          ),
            ...List.generate(
              numOfElements,
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
                    active: index==activeIndex-numOfElements?true:false,
                  ),
                );
              },
            ),
          ]),
    );
  }
}
