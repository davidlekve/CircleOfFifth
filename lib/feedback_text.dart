import 'package:circle_of_fifths/providers/active_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackText extends StatefulWidget {
  FeedbackText({Key? key}) : super(key: key);

  @override
  State<FeedbackText> createState() => _FeedbackTextState();
}

class _FeedbackTextState extends State<FeedbackText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  String _output="";
  Color _color=Colors.white;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(seconds: 1), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ActiveProvider,bool>(
      selector: (context, activeProvider)=>activeProvider.feedbackListener,
      builder: (context, feedback, child){
        Answer answer = context.read<ActiveProvider>().answer;
        print(answer);
        if(answer==Answer.correct){
          _animationController.reverse(from: 1);
          _output="Correct Answer!";
          _color=Colors.green;
        }
        else if(answer==Answer.incorrect){
          _animationController.reverse(from: 1);
          _output="Incorrect Answer!";
          _color=Colors.red;
        }
        return FadeTransition(
          opacity: _animationController,
          child: Center(
              child: Text(_output,
                style: TextStyle(
                  color: _color,
                ),
              )),
        );
      },

    );
  }
}
