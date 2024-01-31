import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/note_bloc.dart';
import 'package:note_app/core/assets.dart';
import 'package:note_app/core/colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: CupertinoSearchTextField(
        backgroundColor: kShadedWhite,
        borderRadius: BorderRadius.circular(15),
        prefixInsets: const EdgeInsetsDirectional.only(start: 14),
        suffixInsets: const EdgeInsetsDirectional.only(end: 10),
        placeholder: 'Search note...',
        placeholderStyle: const TextStyle(
          color: kTextLightGrey,
          letterSpacing: 0.6,
          fontSize: 14,
          fontWeight: FontWeight.w400,
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
        onChanged: (value) {
          context.read<NoteBloc>().add(NoteInitialFetchEvent(query: value));
        },
      ),
    );
  }
}
