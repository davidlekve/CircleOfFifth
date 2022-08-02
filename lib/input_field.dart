import 'package:circle_of_fifths/providers/active_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'InputButton.dart';
import 'providers/input_provider.dart';
import 'providers/active_provider.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key}) : super(key: key);

  static List<String> firstRow = ["A", "B", "C", "D", "E", "F", "G"];
  static List<String> secondRow = ["b", "Natural", "#"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Selector<InputProvider, int>(
            selector: (context, inputProvider) => inputProvider.firstSelected,
            builder: (_, firstSelected, __) {
              return Column(
                children: [
                  Row(
                    children: List.generate(4, (index) {
                      return InputButton(
                        text: firstRow[index],
                        active: firstSelected == index ? true : false,
                        onPressed: () =>
                            context.read<InputProvider>().firstSelected = index,
                      );
                    }),
                  ),
                  Row(
                    children: List.generate(3, (index) {
                      return InputButton(
                        text: firstRow[4 + index],
                        active: firstSelected == index + 4 ? true : false,
                        onPressed: () => context
                            .read<InputProvider>()
                            .firstSelected = index + 4,
                      );
                    }),
                  ),
                ],
              );
            },
          ),
          Divider(),
          Row(
            children: List.generate(
              secondRow.length,
              (index) {
                return InputButton(
                  text: secondRow[index],
                  active: false,
                  onPressed: () {
                    /// secondAnswer is either the b, # or nothing.
                    String secondAnswer = index != 1 ? secondRow[index] : "";

                    /// Combine the firstRow answer with secondAnswer. E.g E+b
                    String answer =
                        firstRow[context.read<InputProvider>().firstSelected] +
                            secondAnswer;

                    String solution = context
                        .read<ActiveProvider>()
                        .notes[context.read<ActiveProvider>().randomActive];

                    if (answer + "m" == solution || answer == solution) {
                      /// CORRECT ANSWER
                      print("CORRECT your answer: $answer, soluton: $solution");
                      context.read<ActiveProvider>().submitAnswer(true);
                    } else {
                      print("INCORRECT your answer: $answer, soluton: $solution");
                      context.read<ActiveProvider>().submitAnswer(false);
                    }

                    context.read<InputProvider>().firstSelected = -1;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
