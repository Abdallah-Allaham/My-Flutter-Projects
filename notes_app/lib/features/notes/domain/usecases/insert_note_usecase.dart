import 'package:notes_app/features/notes/domain/repositories/notes_repository.dart';

import '../entities/note.dart';

class InsertNoteUsecase {
  final NotesRepository notesRepository;

  InsertNoteUsecase({required this.notesRepository});

  Future<int> call({required Note note}) async {
    return await notesRepository.insertNote(note: note);
  }
}
