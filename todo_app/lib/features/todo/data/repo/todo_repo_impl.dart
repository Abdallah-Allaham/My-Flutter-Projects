import 'package:todo_app/features/todo/data/datasource/todo_local_data_source.dart';
import 'package:todo_app/features/todo/domain/entity/todo.dart';

import '../../domain/repo/todo_repo.dart';
import '../model/todo_model.dart';

class TodoRepoImpl implements TodoRepo {
  final TodoLocalDataSource todoLocalDataSource;

  TodoRepoImpl({required this.todoLocalDataSource});

  @override
  Future<List<Todo>> getTodos() async {
    final todoModel = await todoLocalDataSource.getTodos();
    return todoModel.map((todo) => todo.toEntity()).toList();
  }

  @override
  Future<void> addTodo({required Todo todo}) async {
    final todoModel = TodoModel(
      id: todo.id,
      title: todo.title,
      isCompleted: todo.isCompleted,
    );
    await todoLocalDataSource.addTodo(todoModel: todoModel);
  }

  @override
  Future<void> deleteTodo({required String id}) async {
    await todoLocalDataSource.deleteTodo(id: id);
  }

  @override
  Future<void> updateTodo({required Todo todo}) async {
    final todoModel = TodoModel(
      id: todo.id,
      title: todo.title,
      isCompleted: todo.isCompleted,
    );
    await todoLocalDataSource.updateTodo(todoModel: todoModel);
  }
}

extension on TodoModel {
  Todo toEntity() => Todo(id: id, title: title, isCompleted: isCompleted);
}
