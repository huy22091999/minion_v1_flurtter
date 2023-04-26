import 'package:minion_v1/core/base_event.dart';
import 'package:minion_v1/data/model/note.dart';

class AddNoteEvent extends BaseEvent {
  String textNote;

  AddNoteEvent(this.textNote);
}

class DeleteNoteEvent extends BaseEvent {
  late Note note;

  DeleteNoteEvent(this.note);
}
