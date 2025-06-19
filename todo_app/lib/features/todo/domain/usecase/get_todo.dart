import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failures.dart';
import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/todo/domain/entity/todo.dart';

import '../repo/todo_repo.dart';

class GetTodo implements UseCase<Todo,String>{
  final TodoRepo todoRepo;
  GetTodo({required this.todoRepo});

  @override
  Future<Either<Failure, Todo>> call(String id) async {
    return await todoRepo.getTodo(id: id);
  }
}