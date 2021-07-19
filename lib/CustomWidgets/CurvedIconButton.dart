import 'package:flutter/material.dart';

class CurvedIconButton extends StatelessWidget {

  CurvedIconButton({this.icon, this.color, required this.onPressed});
  final IconData? icon;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      fillColor: color,
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}