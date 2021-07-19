import 'package:bmi_calculator/CustomWidgets/BottomContainer.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  final String resultText, resultNumber, resultInterpretation;

  ResultsPage({required this.resultText, required this.resultNumber, required this.resultInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              child: Text(
                "Result",
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: kStatusTextStyle,
                  ),
                  Text(
                    resultNumber,
                    style: kBMINumberTextStyle,
                  ),
                  Text(
                    resultInterpretation,
                    textAlign: TextAlign.center,
                    style: kInterpretationTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
            title: "Check Again",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
