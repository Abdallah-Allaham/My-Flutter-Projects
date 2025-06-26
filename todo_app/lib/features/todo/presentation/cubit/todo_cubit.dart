import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/presentation/cubit/todo_state.dart';

import '../../domain/entity/todo.dart';
import '../../domain/usecase/add_todo_usecase.dart';
import '../../domain/usecase/delete_todo_usecase.dart';
import '../../domain/usecase/get_todos_usecase.dart';

class TodoCubit extends Cubit<TodoState> {
  final GetTodosUsecase getTodosUsecase;
  final AddTodoUsecase addTodoUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;

  TodoCubit({
    required this.getTodosUsecase,
    required this.addTodoUsecase,
    required this.deleteTodoUsecase,
  }) : super(TodoInitial());

  Future<void> getTodos() async {
    emit(TodoLoading());
    try {
      final todos = await getTodosUsecase.call();
      emit(TodoLoaded(todos: todos));
    } catch (e) {
      emit(TodoError(message: "Failed to load todos"));
    }
  }

  Future<void> addTodo({required String title}) async {
    try {
      final todo = Todo(id: DateTime.now().toString(), title: title);
      await addTodoUsecase.call(todo: todo);
      await getTodos();
    }catch(e){
      emit(TodoError(message: "Failed to add todo"));
    }
  }

  Future<void> deleteTodo({required String id}) async {
    try {
      await deleteTodoUsecase.call(id: id);
      await getTodos();
    }catch(e){
      emit(TodoError(message: "Failed to delete todo"));
    }
  }
}
