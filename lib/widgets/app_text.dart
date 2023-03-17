import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  const AppText(
      {Key? key,
      required this.text,
      this.textColor = Colors.black45,
      this.fontWeight = FontWeight.w600,
      this.fontSize = 18.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
