import 'package:flutter/material.dart';
import 'package:note_app/bloc/note_bloc.dart';
import 'package:note_app/core/colors.dart';

class DetailCustomAppbar extends StatelessWidget {
  const DetailCustomAppbar({
    super.key,
    required this.noteBloc,
    required this.noteId,
  });

  final NoteBloc noteBloc;
  final String noteId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 10, 15),
          child: Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.arrow_back_ios, size: 20),
                ),
              ),
              const Text(
                'Your note',
                style: TextStyle(fontSize: 17),
              ),
              const Spacer(),
              PopupMenuButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: kBlue,
                child: const Icon(
                  Icons.more_vert_sharp,
                  size: 22,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                      noteBloc.add(NoteDeleteEvent(noteId: noteId));
                      Navigator.pop(context);
                    },
                    height: 25,
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
