import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/bloc/note_bloc.dart';
import 'package:note_app/core/colors.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/data/models/note_model.dart';
import 'package:note_app/presentation/screens/add_note/cubit/checkbox_cubit.dart';
import 'package:note_app/presentation/screens/add_note/widgets/add_date_and_status_widget.dart';
import 'package:note_app/presentation/screens/add_note/widgets/add_textfield.dart';
import 'package:note_app/presentation/screens/detail/cubit/button_cubit.dart';
import 'package:note_app/presentation/screens/detail/widgets/detail_custom_appbar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.notes,
    required this.noteBloc,
  });

  final NoteModel notes;
  final NoteBloc noteBloc;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool enableSaveBtn = false;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.notes.title);
    descriptionController =
        TextEditingController(text: widget.notes.description);
    debugPrint(widget.notes.id);
    context.read<ButtonCubit>().resetBtn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final checkboxCubit = BlocProvider.of<CheckBoxCubit>(context);
    final buttonCubit = context.read<ButtonCubit>();
    DateTime inputDateTime = DateTime.parse(widget.notes.createdAt!);
    String formattedDateTime =
        DateFormat('hh:mm a | dd MMM yyyy').format(inputDateTime);

    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: DetailCustomAppbar(
              noteBloc: widget.noteBloc,
              noteId: widget.notes.id!,
            ),
          ),
          body: Column(
            children: [
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
                          onChanged: (value) {
                            buttonCubit.enableBtn();
                          },
                        ),
                        kHeight(20),
                        AddDateAndStatusWidget(
                          checkboxCubit: checkboxCubit,
                          dateAndTime: formattedDateTime,
                          isCompleted: widget.notes.isCompleted,
                        ),
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
          floatingActionButton: BlocBuilder<ButtonCubit, bool>(
            builder: (context, state) {
              return state
                  ? _customSaveBtn(context, formKey, widget.notes)
                  : const SizedBox();
            },
          )),
    );
  }

  Visibility _customSaveBtn(
      BuildContext context, GlobalKey<FormState> formKey, NoteModel notes) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: MaterialButton(
        minWidth: double.infinity,
        height: 50,
        color: kBlue,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            final updatedNote = NoteModel(
              id: notes.id,
              title: titleController.text,
              description: descriptionController.text,
              isCompleted: context.read<CheckBoxCubit>().state,
            );
            widget.noteBloc.add(NoteUpdateEvent(note: updatedNote));
          }
        },
        child: const Text(
          'Save',
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
