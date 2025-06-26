import '../repo/todo_repo.dart';

class DeleteTodoUsecase {
  final TodoRepo todoRepo;

  DeleteTodoUsecase({required this.todoRepo});

  Future<void> call({required String id}) async {
    await todoRepo.deleteTodo(id: id);
  }
}