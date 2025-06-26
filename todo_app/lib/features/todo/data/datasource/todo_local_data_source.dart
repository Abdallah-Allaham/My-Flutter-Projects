import 'package:hive/hive.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodo({required TodoModel todoModel});
  Future<void> deleteTodo({required String id});
  Future<void> updateTodo({required TodoModel todoModel});
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource{
  final Box<TodoModel> _todoBox = Hive.box<TodoModel>('todos');

  @override
  Future<List<TodoModel>> getTodos() async{
    return _todoBox.values.toList();
  }

  @override
  Future<void> addTodo({required TodoModel todoModel}) async {
    await _todoBox.put(todoModel.id, todoModel);
  }

  @override
  Future<void> deleteTodo({required String id}) async{
    await _todoBox.delete(id);
  }

  @override
  Future<void> updateTodo({required TodoModel todoModel}) async{
    await _todoBox.put(todoModel.id, todoModel);
  }


}