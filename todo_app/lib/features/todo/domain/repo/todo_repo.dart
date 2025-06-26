import 'package:todo_app/features/todo/domain/entity/todo.dart';

abstract class TodoRepo {
  Future<List<Todo>> getTodos();
  Future<void> addTodo({required Todo todo});
  Future<void> deleteTodo({required String id});
}