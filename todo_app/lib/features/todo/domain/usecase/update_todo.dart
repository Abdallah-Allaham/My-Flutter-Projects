import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failures.dart';
import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/todo/domain/entity/todo.dart';

import '../repo/todo_repo.dart';

class UpdateTodo implements UseCase<Todo,Todo>{
  final TodoRepo todoRepo;
  UpdateTodo({required this.todoRepo});

  @override
  Future<Either<Failure, Todo>> call(Todo todo) async {
     return await todoRepo.updateTodo(todo: todo);
  }
}