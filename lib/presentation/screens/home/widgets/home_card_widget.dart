import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/core/colors.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/data/models/note_model.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.notes,
  });

  final NoteModel notes;

  @override
  Widget build(BuildContext context) {
    DateTime inputDateTime = DateTime.parse(notes.createdAt!);

    String formattedDateTime =
        DateFormat('hh:mm a | dd MMM').format(inputDateTime);

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: kShadedWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notes.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          kHeight(14),
          Text(
            notes.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              color: kTextLightGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formattedDateTime,
                style: const TextStyle(
                  fontSize: 10,
                  color: kTextLightGrey,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor:
                      notes.isCompleted ? Colors.purpleAccent : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
