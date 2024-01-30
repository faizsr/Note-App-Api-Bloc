import 'package:flutter/material.dart';
import 'package:note_app/core/assets.dart';
import 'package:note_app/presentation/widgets/custom_search_field.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Keep Note',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(userAvatar),
                ),
              ],
            ),
          ),
          const CustomSearchField(),
        ],
      ),
    );
  }
}
