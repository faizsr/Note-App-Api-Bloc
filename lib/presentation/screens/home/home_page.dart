import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/note_bloc.dart';
import 'package:note_app/core/colors.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/presentation/screens/add_note/add_note_page.dart';
import 'package:note_app/presentation/screens/detail/detail_page.dart';
import 'package:note_app/presentation/screens/home/widgets/home_card_widget.dart';
import 'package:note_app/presentation/screens/home/widgets/home_custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NoteBloc noteBloc = NoteBloc();

  @override
  void initState() {
    noteBloc.add(NoteInitialFetchEvent(query: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(180),
          child: CustomAppbar(),
        ),
        body: BlocConsumer<NoteBloc, NoteState>(
          bloc: noteBloc,
          listenWhen: (previous, current) => current is NoteActionState,
          buildWhen: (previous, current) => current is! NoteActionState,
          listener: (context, state) {
            if (state is NoteAddSuccessActionState) {
              Navigator.pop(context);
              customSnackbar(context, 'New note added');
            } else if (state is NoteAddErrorActionState) {
              customSnackbar(context, 'Error creating new note');
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case NoteFetchingLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case NoteFetchingSuccessState:
                final successState = state as NoteFetchingSuccessState;
                return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: successState.notes.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        nextScreen(
                          context,
                          DetailPage(
                            notes: successState.notes[index],
                            noteBloc: noteBloc,
                          ),
                        );
                      },
                      child: HomeCardWidget(
                        notes: successState.notes[index],
                      ),
                    );
                  },
                );
              default:
                return const SizedBox(
                  child: Center(
                    child: Text('Could Not Load!!'),
                  ),
                );
            }
          },
        ),
        floatingActionButton: _addButton(context, noteBloc),
      ),
    );
  }

  FloatingActionButton _addButton(BuildContext context, NoteBloc noteBloc) {
    return FloatingActionButton(
      onPressed: () {
        nextScreen(context, AddNotePage(noteBloc: noteBloc));
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
