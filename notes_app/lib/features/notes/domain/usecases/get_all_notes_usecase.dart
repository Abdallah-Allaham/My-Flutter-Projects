import '../entities/note.dart';
import '../repositories/notes_repository.dart';

class GetAllNotesUsecase {
  final NotesRepository notesRepository;

  GetAllNotesUsecase({required this.notesRepository});

  Future<List<Note>> call() async {
    return await notesRepository.getAllNotes();
  }
}
