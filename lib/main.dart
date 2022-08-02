import 'package:circle_of_fifths/providers/active_provider.dart';
import 'package:circle_of_fifths/input_field.dart';
import 'package:circle_of_fifths/providers/input_provider.dart';
import 'package:circle_of_fifths/providers/settings_provider.dart';
import 'package:circle_of_fifths/screens/settings_screen.dart';
import 'package:circle_of_fifths/screens/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'circle_of_fifths.dart';
import 'feedback_text.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (BuildContext context) => ActiveProvider()),
            ChangeNotifierProvider(
                create: (BuildContext context) => InputProvider()),
            ChangeNotifierProvider(create: (BuildContext context)=>SettingsProvider()),
          ],
      child: const MaterialApp(home: HomePage())));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text("Circle of fifths"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.insert_chart_outlined_rounded),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StatisticsScreen()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.settings),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                  },
                ),
              )
            ],
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleOfFifths(),
                FeedbackText(),
                const InputField(),
              ]
          ),
    );
  }
}
