import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';

class GenderCard extends StatelessWidget {
  GenderCard({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15,),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}