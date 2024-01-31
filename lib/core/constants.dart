import 'package:flutter/material.dart';
import 'package:note_app/core/colors.dart';
import 'package:page_transition/page_transition.dart';

kWidth(double width) => SizedBox(width: width);
kHeight(double height) => SizedBox(height: height);

void customSnackbar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: kBlue,
      duration: const Duration(milliseconds: 1200),
    ),
  );
}

nextScreen(context, page) {
  Navigator.push(
    context,
    PageTransition(
      child: page,
      type: PageTransitionType.fade,
    ),
  );
}
