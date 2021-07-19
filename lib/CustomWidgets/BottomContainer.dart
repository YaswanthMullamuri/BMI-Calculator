import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';

class BottomContainer extends StatelessWidget {

  BottomContainer({required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kBottomContainerTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20),
        height: kBottomContainerHeight,
      ),
    );
  }
}