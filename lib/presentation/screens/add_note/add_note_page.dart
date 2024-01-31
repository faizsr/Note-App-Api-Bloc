import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/note_bloc.dart';
import 'package:note_app/core/colors.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/data/models/note_model.dart';
import 'package:note_app/presentation/screens/add_note/cubit/checkbox_cubit.dart';
import 'package:note_app/presentation/screens/add_note/widgets/add_custom_appbar.dart';
import 'package:note_app/presentation/screens/add_note/widgets/add_date_status_widget.dart';
import 'package:note_app/presentation/screens/add_note/widgets/add_textfield.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({
    super.key,
    required this.noteBloc,
  });
  final NoteBloc noteBloc;

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late CheckBoxCubit checkBoxBloc;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    checkBoxBloc = BlocProvider.of<CheckBoxCubit>(context);
    checkBoxBloc.resetChecked();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AddCustomAppbar(),
        ),
        body: Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AddCustomTextField(
                        controller: titleController,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        hintText: 'Title',
                      ),
                      kHeight(20),
                      AddDateAndStatusWidget(checkboxCubit: checkBoxBloc),
                      const Divider(),
                      AddCustomTextField(
                        controller: descriptionController,
                        hintText: 'Write your notes here...',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: _customCreateBtn(
          context: context,
          title: titleController.text,
          description: descriptionController.text,
          isCompleted: false,
          noteBloc: widget.noteBloc,
          formKey: formKey,
        ),
      ),
    );
  }

  Visibility _customCreateBtn({
    required BuildContext context,
    required String title,
    required String description,
    required bool isCompleted,
    required NoteBloc noteBloc,
    required GlobalKey<FormState> formKey,
  }) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: MaterialButton(
        minWidth: double.infinity,
        height: 50,
        color: kBlue,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            final newNote = NoteModel(
              title: title,
              description: description,
              isCompleted: isCompleted,
            );
            noteBloc.add(NoteAddEvent(note: newNote));
          } else {
            customSnackbar(context, 'Fill all forms');
          }
        },
        child: const Text(
          'Create',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
