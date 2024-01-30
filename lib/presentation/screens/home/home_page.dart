import 'package:flutter/material.dart';
import 'package:note_app/core/assets.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/presentation/widgets/custom_search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(180),
          child: Container(
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
          ),
        ),
        body: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: const [
            HomeCardWidget(
              text: 'How to write thanks you note',
            ),
            HomeCardWidget(
              text: 'Learn the basics of being an UI Designer',
            ),
            HomeCardWidget(
              text: 'Learn the basics of being an UI Designer',
            ),
            HomeCardWidget(
              text: 'How to write thanks you note',
            ),
            HomeCardWidget(
              text: 'How to write thanks you note',
            ),
            HomeCardWidget(
              text: 'Learn the basics of being an UI Designer',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF3757f8),
          shape: const CircleBorder(),
          elevation: 0,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}

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
          const Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: 6,
              backgroundColor: Colors.purpleAccent,
            ),
          ),
        ],
      ),
    );
  }
}
