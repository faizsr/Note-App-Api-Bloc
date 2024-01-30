import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/colors.dart';
import 'package:note_app/presentation/widgets/custom_search_field.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Keep Note',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: kShadedWhite,
                  child: Icon(CupertinoIcons.square_grid_2x2),
                ),
              ],
            ),
          ),
          CustomSearchField(),
        ],
      ),
    );
  }
}
