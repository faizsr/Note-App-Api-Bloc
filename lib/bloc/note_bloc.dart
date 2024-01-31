import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/models/note_model.dart';
import 'package:note_app/domain/repos/note_repo.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<NoteInitialFetchEvent>(noteInitialFetchEvent);
    on<NoteAddEvent>(noteAddEvent);
  }

  FutureOr<void> noteInitialFetchEvent(
      NoteInitialFetchEvent event, Emitter<NoteState> emit) async {
    emit(NoteFetchingLoadingState());
    List<NoteModel> notes = await NoteRepo.fetchNotes();
    emit(NoteFetchingSuccessState(notes: notes));
  }

  FutureOr<void> noteAddEvent(
      NoteAddEvent event, Emitter<NoteState> emit) async {
    bool success = await NoteRepo.addNote(note: event.note);
    print(success);
    if (success) {
      emit(NoteAddSuccessActionState());
    } else {
      emit(NoteAddErrorActionState());
    }
  }
}
