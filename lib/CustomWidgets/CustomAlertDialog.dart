import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {

  CustomAlertDialog({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: kPopUpTextStyle,
      ),
      actions: [
        CupertinoDialogAction(
          child: Text("Ok!"),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
