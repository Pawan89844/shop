import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final bool readOnly;
  final void Function()? onTap;
  final void Function(String value)? onChanged;
  AppTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.suffix,
      this.readOnly = false,
      this.onTap,
      this.onChanged});

  final kOutlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.black12));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
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
