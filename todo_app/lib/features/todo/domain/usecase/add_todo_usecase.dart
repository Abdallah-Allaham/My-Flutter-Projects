import '../entity/todo.dart';
import '../repo/todo_repo.dart';

class AddTodoUsecase {
  final TodoRepo todoRepo;

  AddTodoUsecase({required this.todoRepo});

  Future<void> call({required Todo todo}) async {
    await todoRepo.addTodo(todo: todo);
  }
}
