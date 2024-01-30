import 'package:flutter/material.dart';
import 'package:note_app/core/constants.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFeff2f9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          kHeight(14),
          const Text(
            'Generatae lorem Ipsum placeholder text select the number of .',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFFbfc0c8),
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '10:00 PM | 24 Sep',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFFbfc0c8),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.purpleAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
