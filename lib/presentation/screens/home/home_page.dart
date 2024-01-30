import 'package:flutter/material.dart';
import 'package:note_app/core/colors.dart';
import 'package:note_app/presentation/screens/add_note/add_note_page.dart';
import 'package:note_app/presentation/screens/home/widgets/home_card_widget.dart';
import 'package:note_app/presentation/screens/home/widgets/home_custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(180),
          child: CustomAppbar(),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return const HomeCardWidget(
              text: 'How to write thanks you note',
            );
          },
        ),
        floatingActionButton: _addButton(context),
      ),
    );
  }

  FloatingActionButton _addButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AddNotePage(),
        ));
      },
      backgroundColor: kBlue,
      shape: const CircleBorder(),
      elevation: 0,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
