import 'package:notes_app/features/notes/data/models/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class NotesLocalDatasource {
  Future<List<NoteModel>> getAllNotes();

  Future<int> insertNote({required NoteModel note});

  Future<int> updateNote({required NoteModel note});

  Future<int> deleteNote({required int id});
}

class NotesLocalDatasourceImpl implements NotesLocalDatasource {
  static final NotesLocalDatasourceImpl _singleton =
      NotesLocalDatasourceImpl._internal();

  factory NotesLocalDatasourceImpl() => _singleton;

  NotesLocalDatasourceImpl._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT,
            createdAt TEXT
          )
        ''');
      },
    );
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final db = await database;
    final notes = await db.query('notes', orderBy: 'createdAt DESC');
    return notes.map((note) => NoteModel.fromMap(note)).toList();
  }

  @override
  Future<int> insertNote({required NoteModel note}) async {
    final db = await database;
    return await db.insert('notes', note.toMap());
  }

  @override
  Future<int> deleteNote({required int id}) async {
    final db = await database;
    return db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> updateNote({required NoteModel note}) async {
    final db = await database;
    return db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
