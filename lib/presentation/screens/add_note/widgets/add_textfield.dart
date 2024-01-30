import 'package:flutter/material.dart';

class AddCustomTextField extends StatelessWidget {
  const AddCustomTextField({
    super.key,
    required this.hintText,
    required this.fontSize,
    required this.fontWeight,
  });

  final String hintText;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
