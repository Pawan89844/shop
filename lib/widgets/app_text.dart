import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String data;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLine;
  const AppText(this.data,
      {super.key,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.decoration,
      this.overflow,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: decoration,
          overflow: overflow),
    );
  }
}
