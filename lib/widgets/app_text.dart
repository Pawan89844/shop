import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String data;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  const AppText(this.data,
      {super.key, this.color, this.fontSize, this.fontWeight, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
