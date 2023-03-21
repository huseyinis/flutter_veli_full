import 'package:flutter/material.dart';

import '202/alert_learn.dart';
import '202/animated_learn_view.dart';
import '202/cache/secure_context/secure_context_learn.dart';
import '202/sheet_learn.dart';
import '202/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: LightTheme().theme,

      // ThemeData.dark().copyWith(
      //   tabBarTheme: TabBarTheme(
      //       labelColor: Colors.white, unselectedLabelColor: Colors.red, indicatorSize: TabBarIndicatorSize.label),
      //   inputDecorationTheme: InputDecorationTheme(
      //       filled: true,
      //       fillColor: Colors.white,
      //       border: OutlineInputBorder(),
      //       iconColor: Colors.red,
      //       floatingLabelStyle: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.w600)),
      //   appBarTheme: AppBarTheme(
      //       centerTitle: true,
      //       systemOverlayStyle: SystemUiOverlayStyle.light,
      //       backgroundColor: Colors.transparent,
      //       elevation: 0),
      // ),
      home: AlertLearn(),
    );
  }
}
