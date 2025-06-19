import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failures.dart';
import 'package:todo_app/core/usecase/usecase.dart';

import '../repo/todo_repo.dart';

class DeleteTodo implements UseCase<Unit,String>{
  final TodoRepo todoRepo;
  DeleteTodo({required this.todoRepo});

  @override
  Future<Either<Failure, Unit>> call(String id) async {
     return await todoRepo.deleteTodo(id: id);
  }
}