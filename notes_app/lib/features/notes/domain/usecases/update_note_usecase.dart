import 'package:notes_app/features/notes/domain/repositories/notes_repository.dart';

import '../entities/note.dart';

class UpdateNoteUsecase {
  final NotesRepository notesRepository;

  UpdateNoteUsecase({required this.notesRepository});

  Future<int> call({required Note note}) async {
    return await notesRepository.updateNote(note: note);
  }
}
