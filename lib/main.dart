import 'package:flutter/material.dart';

import 'screens/calc/calc_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPN Calc',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Typography.englishLike2018,
        splashFactory: InkRipple.splashFactory,
      ),
      home: CalcScreen(),
    );
  }
}
