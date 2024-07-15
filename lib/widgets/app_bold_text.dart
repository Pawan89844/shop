import 'package:flutter/material.dart';
import 'package:shop/constants/app_colors.dart';

class AppBoldText extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize;
  final Color? color;
  const AppBoldText(this.data,
      {super.key,
      this.fontWeight = FontWeight.w800,
      this.fontSize = 22.0,
      this.color = AppColor.boldTextColor});

  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: TextStyle(
            color: color, fontWeight: fontWeight, fontSize: fontSize));
  }
}
