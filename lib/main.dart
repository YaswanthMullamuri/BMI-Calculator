import 'package:flutter/material.dart';
import 'AppPages/InputPage.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF252929),
        scaffoldBackgroundColor: Color(0xFF252929),
      ),
    );
  }
}

// This app is built for mobile devices. Though it works in web, it is not well optimized!