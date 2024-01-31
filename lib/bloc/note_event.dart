part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}

class NoteInitialFetchEvent extends NoteEvent {}

class NoteAddEvent extends NoteEvent {
  final NoteModel note;

  NoteAddEvent({
    required this.note,
  });
}
