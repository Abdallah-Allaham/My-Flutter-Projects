import 'package:todo_app/features/todo/domain/repo/todo_repo.dart';

import '../entity/todo.dart';

class UpdateTodoUsecase {
  final TodoRepo todoRepo;

  UpdateTodoUsecase({required this.todoRepo});

  Future<void> call({required Todo todo}) async {
    await todoRepo.updateTodo(todo: todo);
  }
}