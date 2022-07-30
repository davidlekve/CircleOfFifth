import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key}) : super(key: key);

  static List<String> firstRow=["A","B","C","D","E","F","G"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Row(
          children: List.generate(4, (index){
            return Expanded(child: TextButton(onPressed: (){}, child: Text(firstRow[index])));
          }),
        ),
          Row(
            children: List.generate(3, (index){
              return Expanded(child: TextButton(onPressed: (){}, child: Text(firstRow[4+index])));
            }),
          ),
        Divider(),
        Row(
          children: [
            Expanded(child: TextButton(onPressed: () {},
            child: Text("b"),)),
            Expanded(child: TextButton(onPressed: () {},
              child: Text("Natural"),)),
            Expanded(child: TextButton(onPressed: () {},
              child: Text("#"),))
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: TextButton(onPressed: () {},
              child: Text("Minor"),)),
            Expanded(child: TextButton(onPressed: () {},
              child: Text("Major"),))
          ],
        )
      ],),
    );
  }
}
