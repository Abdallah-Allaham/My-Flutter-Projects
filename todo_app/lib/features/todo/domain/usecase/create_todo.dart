import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failures.dart';
import 'package:todo_app/features/todo/domain/entity/todo.dart';

import '../../../../core/usecase/usecase.dart';
import '../repo/todo_repo.dart';

class CreateTodo implements UseCase<Todo,Todo>{
  final TodoRepo todoRepo;
  CreateTodo({required this.todoRepo});

  @override
  Future<Either<Failure, Todo>> call(Todo todo) async {
     return await todoRepo.createTodo(todo: todo);
  }
}