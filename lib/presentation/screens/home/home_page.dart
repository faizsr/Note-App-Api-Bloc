import 'package:flutter/material.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/presentation/widgets/custom_search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(180),
          child: Container(
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
                      CircleAvatar(),
                    ],
                  ),
                ),
                CustomSearchField(),
              ],
            ),
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFeff2f9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'How to write thanks you note',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  kHeight(10),
                  const Text(
                    'Generatae lorem Ipsum placeholder text select the number of.',
                    style: TextStyle(fontSize: 10),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
