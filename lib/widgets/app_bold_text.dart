import 'package:flutter/material.dart';
import 'package:shop/constants/app_colors.dart';

class AppBoldText extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize;
  const AppBoldText(this.data,
      {super.key, this.fontWeight = FontWeight.w800, this.fontSize = 22.0});

  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: TextStyle(
            color: AppColor.boldTextColor,
            fontWeight: fontWeight,
            fontSize: fontSize));
  }
}
