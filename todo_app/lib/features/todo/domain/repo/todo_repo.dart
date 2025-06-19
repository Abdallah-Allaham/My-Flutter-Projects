import 'package:dartz/dartz.dart';
import 'package:todo_app/features/todo/domain/entity/todo.dart';

import '../../../../core/error/failures.dart';

abstract class TodoRepo {
  Future<Either<Failure,List<Todo>>> getTodos();
  Future<Either<Failure,Todo>> getTodo({required String id});
  Future<Either<Failure,Todo>> createTodo({required Todo todo});
  Future<Either<Failure,Todo>> updateTodo({required Todo todo});
  Future<Either<Failure,Unit>> deleteTodo({required String id});
}