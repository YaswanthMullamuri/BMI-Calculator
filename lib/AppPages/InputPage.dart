import 'package:bmi_calculator/AppPages/ResultsPage.dart';
import 'package:bmi_calculator/CalculateBMI.dart';
import 'package:bmi_calculator/CustomWidgets/CustomAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../CustomWidgets/ReusableContainer.dart';
import '../CustomWidgets/GenderCard.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/CustomWidgets/CurvedIconButton.dart';
import 'package:bmi_calculator/CustomWidgets/BottomContainer.dart';

enum _Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Used in changing color when selected. Initially, it will be null so that both male and female start with default inactive color.
  _Gender? selectedGender;
  int height = 180;
  int weight = 70;
  int age = 18;

  void updateGender(_Gender? selectedGender) {
    setState(() {
      this.selectedGender = selectedGender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableContainer(
                  onPress: () => updateGender(_Gender.male),
                  colour: selectedGender == _Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: GenderCard(
                    icon: FontAwesomeIcons.male,
                    text: "Male",
                  ),
                ),
              ),
              Expanded(
                child: ReusableContainer(
                  onPress: () => updateGender(_Gender.female),
                  colour: selectedGender == _Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: GenderCard(
                    icon: FontAwesomeIcons.female,
                    text: "Female",
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableContainer(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kHeightTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kSliderColor,
                        inactiveTrackColor: Color(0xFFCDD8EE),
                        thumbColor: kSliderColor,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 25,
                        )),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableContainer(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kHeightTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CurvedIconButton(
                            onPressed: () {
                              if (weight > 0) {
                                setState(() {
                                  weight--;
                                });
                              }
                            },
                            icon: FontAwesomeIcons.minus,
                            color: kPlusMinusColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CurvedIconButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                            color: kPlusMinusColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableContainer(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kHeightTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CurvedIconButton(
                            onPressed: () {
                              if (age > 0) {
                                setState(() {
                                  age--;
                                });
                              }
                            },
                            icon: FontAwesomeIcons.minus,
                            color: kPlusMinusColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CurvedIconButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                            color: kPlusMinusColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomContainer(
            title: "Calculate",
            onTap: () {
              if (selectedGender != null) {
                CalculateBMI calculateBMI =
                    CalculateBMI(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      resultText: calculateBMI.getTestResult().toUpperCase(),
                      resultNumber: calculateBMI.getBMIValue(),
                      resultInterpretation: calculateBMI.getInterpretation(),
                    ),
                  ),
                );
              } else {
                showDialog(

                  context: context,
                  builder: (context) => CustomAlertDialog(
                    title: "Please Select the gender",
                  ),
                  barrierDismissible: false,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
