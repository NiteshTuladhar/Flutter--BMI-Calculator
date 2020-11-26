import 'package:flutter/material.dart';
import 'input_dart.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //Dart uses the ARGB where A is the alpha meaning opacity so 
        //istead of #0A0E21 we use 0XFF0A0E21 where 0XFF is the opacity level
        primaryColor: Color(0XFF0A0E21), 
        scaffoldBackgroundColor: Color(0XFF0A0E21),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
       ), 
      ),
      home: InputPage(),
    );
  }
}


