import 'package:dartz/dartz.dart';
import 'package:todo_app/features/todo/domain/repo/todo_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/todo.dart';

class GetTodos implements UseCase<List<Todo>, NoParams> {
  final TodoRepo todoRepo;

  GetTodos({required this.todoRepo});

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    return await todoRepo.getTodos();
  }
}
