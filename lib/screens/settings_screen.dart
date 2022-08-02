import 'package:circle_of_fifths/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  late double _value;
  // Map<double, String> difficulty={
  //   0:"easy",
  //   1:"medium",
  //   2:"difficult",
  //   3:"hard"
  // };

  @override
  void initState() {
    _value=context.read<SettingsProvider>().visibility.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Visibility", style: TextStyle(fontSize: 20,),textAlign: TextAlign.left),
            const SizedBox(height: 10,),
            const Text("Select how much percentage of the other values will show"),
            Text("Visibility: ${_value.round()}%"),
            Slider(
              min: 0,
              max: 100,
                label: "Select your difficulty",
                value: _value, onChanged: (value){
              setState(() {
                _value=value;
              });
            },
              onChangeEnd: (value){
                context.read<SettingsProvider>().visibility=value.round();
              },
            ),
            const SizedBox(height: 10,),
            const Text("Smart Select", style: TextStyle(fontSize: 20,),textAlign: TextAlign.left),
            const SizedBox(height: 10,),
            const Text("When active the next question is chosen based on your performance. It will more frequently choose those notes that you get wrong or use a lot of time on."),
            Switch(value: false, onChanged: (_){})
          ],

          /// TODO add settings for showing sharps, flats or both
          /// TODO add settings for what are correct answer (sharps, flats or both)
        ),
      ),
      );
  }
}


