import 'package:flutter/material.dart';
import 'package:shop/constants/app_colors.dart';

class AppBoldText extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  const AppBoldText(this.data,
      {super.key,
      this.fontWeight = FontWeight.w800,
      this.fontSize = 22.0,
      this.color = AppColor.boldTextColor,
      this.textAlign,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(data,
        textAlign: textAlign,
        overflow: overflow,
        style: TextStyle(
            color: color, fontWeight: fontWeight, fontSize: fontSize));
  }
}
