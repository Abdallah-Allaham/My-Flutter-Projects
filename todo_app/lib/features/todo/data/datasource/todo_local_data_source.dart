import 'package:todo_app/features/todo/data/model/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodo({required TodoModel todoModel});
  Future<void> deleteTodo({required String id});
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource{
  List<TodoModel> _todos = [];

  @override
  Future<List<TodoModel>> getTodos() async{
    return _todos;
  }

  @override
  Future<void> addTodo({required TodoModel todoModel}) async {
    _todos.add(todoModel);
  }

  @override
  Future<void> deleteTodo({required String id}) async{
    _todos.removeWhere((todo) => todo.id == id);
  }

}