import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: ColorsItems().sulu,
          child: Text('data'),
        ));
  }
}

class ColorsItems {
  final Color porsche = Color(0xffEDB761);
  final Color sulu = Color.fromARGB(198, 237, 97, 1);
}
