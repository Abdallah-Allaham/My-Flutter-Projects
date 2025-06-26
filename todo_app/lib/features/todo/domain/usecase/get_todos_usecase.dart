import '../entity/todo.dart';
import '../repo/todo_repo.dart';

class GetTodosUsecase {
  final TodoRepo todoRepo;

  GetTodosUsecase({required this.todoRepo});

  Future<List<Todo>> call() async {
    return await todoRepo.getTodos();
  }
}
