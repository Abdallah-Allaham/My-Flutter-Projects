import '../entities/note.dart';

abstract class NotesRepository {
  Future<List<Note>> getAllNotes();
  Future<int> insertNote({required Note note});
  Future<int> updateNote({required Note note});
  Future<int> deleteNote({required int id});

}