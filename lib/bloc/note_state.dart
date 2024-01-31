part of 'note_bloc.dart';

@immutable
sealed class NoteState {}

sealed class NoteActionState extends NoteState {}

final class NoteInitial extends NoteState {}

class NoteFetchingLoadingState extends NoteState {}

class NoteFetchingSuccessState extends NoteState {
  final List<NoteModel> notes;
  NoteFetchingSuccessState({
    required this.notes,
  });
}

class NoteFetchingErrorState extends NoteState {}

class NoteAddSuccessActionState extends NoteActionState {}
class NoteUpdateSuccessActionState extends NoteActionState {}
class NoteDeleteSuccessActionState extends NoteActionState {}

class NoteAddErrorActionState extends NoteActionState {}
class NoteUpdateErrorActionState extends NoteActionState {}
class NoteDeleteErrorActionState extends NoteActionState {}
