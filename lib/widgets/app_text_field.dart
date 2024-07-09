import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter/src/gestures/recognizer.dart';
import 'package:flutter/src/services/text_formatter.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  AppTextField({super.key, this.controller, this.hintText, this.suffix});

  final kOutlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.black12));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffix,
            isDense: true,
            border: kOutlineBorder,
            enabledBorder: kOutlineBorder,
            focusedBorder: kOutlineBorder),
      ),
    );
  }
}
