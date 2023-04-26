
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'note_table.dart';

class NoteDatabase {
  static const DB_NAME = "note.db";
  static const DB_VERSION = 1;
  static late Database _database;

  NoteDatabase._internal();

  Database get database => _database;
  static final NoteDatabase instance = NoteDatabase._internal();

  init() async {
    _database = await openDatabase(join(await getDatabasesPath(), DB_NAME),
        onCreate: (db, version) {
      db.execute(NoteTable.CREATE_TABLE_QUERY);
    }, onUpgrade: (db, oldVersion, newVersion) {
      db.execute(NoteTable.DROP_TABLE_QUERY);
    }, version: DB_VERSION);
  }
}
