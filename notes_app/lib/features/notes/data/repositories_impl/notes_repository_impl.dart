import 'package:notes_app/features/notes/domain/entities/note.dart';

import '../../domain/repositories/notes_repository.dart';
import '../datasources/notes_local_datasource.dart';
import '../models/note_model.dart';

class NotesRepositoryImpl implements NotesRepository {
  final NotesLocalDatasource _localDatasource = NotesLocalDatasourceImpl();

  @override
  Future<List<Note>> getAllNotes() async {
    return await _localDatasource.getAllNotes();
  }

  @override
  Future<int> insertNote({required Note note}) async{
    final model = NoteModel(
      title: note.title,
      content: note.content,
      createdAt: note.createdAt,
    );
    return await _localDatasource.insertNote(note: model);
  }

  @override
  Future<int> deleteNote({required int id}) async{
    return await _localDatasource.deleteNote(id: id);
  }

  @override
  Future<int> updateNote({required Note note}) async {
    final model = NoteModel(
      id: note.id,
      title: note.title,
      content: note.content,
      createdAt: note.createdAt,);
    return await _localDatasource.updateNote(note: model);
  }
}