import 'dart:math';

class CalculateBMI {
  int height;
  int weight;
  late double _bmi;

  CalculateBMI({required this.height, required this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  String getBMIValue() {
    return _bmi.toStringAsFixed(2);
  }

  String getTestResult() {
    if (_bmi >= 25) return "overweight";
    if (_bmi > 18.5) return "normal";
    return "underweight";
  }

  String getInterpretation() {
    if (_bmi >= 25) return "Your body weight is higher than Normal";
    if (_bmi > 18.5) return "Your body weight is Normal!";
    return "Your body weight is lower than Normal";
  }
}