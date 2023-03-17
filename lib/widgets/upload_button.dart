import 'package:flutter/material.dart';
import 'package:upload_files/widgets/app_text.dart';

class UploadButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? buttonColor;

  const UploadButton(
      {Key? key,
      required this.text,
      this.textColor,
      this.buttonColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: buttonColor == Colors.white ? Colors.grey : Colors.black)),
      child: Center(
        child: AppText(
          text: text,
          textColor: textColor,
        ),
      ),
    );
  }
}
