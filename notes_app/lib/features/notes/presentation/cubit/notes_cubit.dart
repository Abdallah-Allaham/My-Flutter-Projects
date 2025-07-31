import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/note.dart';
import '../../domain/usecases/delete_note_usecase.dart';
import '../../domain/usecases/get_all_notes_usecase.dart';
import '../../domain/usecases/insert_note_usecase.dart';
import '../../domain/usecases/update_note_usecase.dart';
import '../state/notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final GetAllNotesUsecase getAllNotesUsecase;
  final InsertNoteUsecase insertNoteUsecase;
  final UpdateNoteUsecase updateNoteUsecase;
  final DeleteNoteUsecase deleteNoteUsecase;

  NotesCubit({
    required this.getAllNotesUsecase,
    required this.insertNoteUsecase,
    required this.updateNoteUsecase,
    required this.deleteNoteUsecase,
  }) : super(NotesInitial());

  Future<void> getAllNotes() async {
    emit(NotesLoading());
    try {
      final notes = await getAllNotesUsecase.call();
      emit(NotesLoaded(notes: notes));
    } catch (e) {
      emit(NotesError(message: "Failed to load notes"));
    }
  }

  Future<void> insertNote({required Note note}) async {
    await insertNoteUsecase.call(note: note);
    await getAllNotes();
  }

  Future<void> updateNote({required Note note}) async {
    await updateNoteUsecase.call(note: note);
    await getAllNotes();
  }

  Future<void> deleteNote({required int id}) async {
    await deleteNoteUsecase.call(id: id);
    await getAllNotes();
  }
}
