import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/assets.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: CupertinoSearchTextField(
        backgroundColor: const Color(0xFFeff2f9),
        borderRadius: BorderRadius.circular(15),
        prefixInsets: const EdgeInsetsDirectional.only(start: 14),
        suffixInsets: const EdgeInsetsDirectional.only(end: 10),
        placeholder: 'Search note...',
        placeholderStyle: const TextStyle(
          color: Color(0xFFc1c3c8),
          letterSpacing: 0.8,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: SizedBox(
          width: 16,
          child: Image.asset(
            search,
            color: Colors.grey,
          ),
        ),
        suffixIcon: const Icon(
          CupertinoIcons.xmark_circle_fill,
          color: Colors.grey,
        ),
        style: TextStyle(
          color: Colors.grey.shade500,
          letterSpacing: 0.7,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
