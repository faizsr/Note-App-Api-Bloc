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

class NoteUpdateEvent extends NoteEvent {
  final NoteModel note;

  NoteUpdateEvent({
    required this.note,
  });
}

class NoteDeleteEvent extends NoteEvent {
  final String noteId;

  NoteDeleteEvent({
    required this.noteId,
  });
}
