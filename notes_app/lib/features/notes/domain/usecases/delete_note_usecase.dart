import '../repositories/notes_repository.dart';

class DeleteNoteUsecase {
  final NotesRepository notesRepository;

  DeleteNoteUsecase({required this.notesRepository});

  Future<int> call({required int id}) async {
    return await notesRepository.deleteNote(id: id);
  }
}
