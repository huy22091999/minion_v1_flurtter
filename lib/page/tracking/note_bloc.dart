import 'dart:async';
import 'dart:math';

import 'package:minion_v1/core/base_bloc.dart';
import 'package:minion_v1/core/base_event.dart';

import '../../data/model/note.dart';
import 'note_event.dart';

class NoteBloc extends BaseBloc {
  final StreamController<List<Note>> _listNoteController = StreamController();

  Stream<List<Note>> get streamNotes => _listNoteController.stream;
  final List<Note> _notes = <Note>[];
  final _randomInt = Random();

  _addNote(Note note) {
    _notes.add(note);
    _listNoteController.sink.add(_notes);
  }

  _deleteNote(Note note) {
    _notes.remove(note);
    _listNoteController.sink.add(_notes);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddNoteEvent) {
      Note note = Note.fromData(_randomInt.nextInt(1000), event.textNote);
      _addNote(note);
    } else if (event is DeleteNoteEvent) {
      _deleteNote(event.note);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
