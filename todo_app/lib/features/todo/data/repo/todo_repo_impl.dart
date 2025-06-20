import 'package:dartz/dartz.dart';

import 'package:todo_app/core/error/failures.dart';

import 'package:todo_app/features/todo/domain/entity/todo.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repo/todo_repo.dart';
import '../datasource/todo_local_data_source.dart';
import '../datasource/todo_remote_data_source.dart';
import '../model/todo_model.dart';

class TodoRepoImpl implements TodoRepo {
  final TodoRemoteDataSource todoRemoteDataSource;
  final TodoLocalDataSource todoLocalDataSource;
  final NetworkInfo networkInfo;

  TodoRepoImpl({
    required this.todoRemoteDataSource,
    required this.todoLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    if (await networkInfo.isConnected) {
      try {
        final resultRemote = await todoRemoteDataSource.getTodos();
        await todoLocalDataSource.cacheTodos(resultRemote);
        return Right(resultRemote.map((model) => model as Todo).toList());
      } on ServerException {
        try {
          final resultLocal = await todoLocalDataSource.getCachedTodos();
          return Right(resultLocal.map((model) => model as Todo).toList());
        } on CacheException {
          return Left(CacheFailure());
        }
      }
    } else {
      try {
        final result = await todoLocalDataSource.getCachedTodos();
        return Right(result.map((model) => model as Todo).toList());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Todo>> getTodo({required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await todoRemoteDataSource.getTodo(id: id);
        return Right(result as Todo);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Todo>> createTodo({required Todo todo}) async {
    final todoModel = todo as TodoModel;
    if (await networkInfo.isConnected) {
      try {
        final newTodo = await todoRemoteDataSource.createTodo(todo: todoModel);
        return Right(newTodo as Todo);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Todo>> updateTodo({required Todo todo}) async {
    final todoModel = todo as TodoModel;
    if (await networkInfo.isConnected) {
      try {
        final updatedTodo = await todoRemoteDataSource.updateTodo(
          todo: todoModel,
        );
        return Right(updatedTodo as Todo);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTodo({required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        return todoRemoteDataSource.deleteTodo(id: id).then((_) => Right(unit));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
