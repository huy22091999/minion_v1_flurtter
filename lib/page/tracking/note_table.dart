
import 'package:sqflite/sqflite.dart';

import '../../data/model/note.dart';
import 'note_database.dart';

class NoteTable {
  static const TABLE_NAME = 'note';
  static const CREATE_TABLE_QUERY = ''
      'CREATE TABLE $TABLE_NAME('
      ' id INTEGER PRIMARY KEY,'
      'content TEXT'
      ')';
  static const DROP_TABLE_QUERY = ''
      'DROP TABLE IF EXIST $TABLE_NAME'
      '';

  Future<int> insertNote(Note note) {
    final Database db = NoteDatabase.instance.database;
    return db.insert(TABLE_NAME, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteNote(Note note) {
    final Database db = NoteDatabase.instance.database;
    return db.delete(TABLE_NAME, where: 'id=?', whereArgs: [note.id]);
  }

  Future<List<Note>> selectAllNote() async {
    final Database db = NoteDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
    return List.generate(maps.length, (index) {
      return Note.fromData(maps[index]['id'], maps[index]['content']);
    });
  }
}
