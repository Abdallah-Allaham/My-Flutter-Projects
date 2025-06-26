import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/presentation/cubit/todo_state.dart';

import '../../domain/entity/todo.dart';
import '../../domain/usecase/add_todo_usecase.dart';
import '../../domain/usecase/delete_todo_usecase.dart';
import '../../domain/usecase/get_todos_usecase.dart';
import '../../domain/usecase/update_todo_usecase.dart';

class TodoCubit extends Cubit<TodoState> {
  final GetTodosUsecase getTodosUsecase;
  final AddTodoUsecase addTodoUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;
  final UpdateTodoUsecase updateTodoUsecase;

  TodoCubit({
    required this.getTodosUsecase,
    required this.addTodoUsecase,
    required this.deleteTodoUsecase,
    required this.updateTodoUsecase,
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
    } catch (e) {
      emit(TodoError(message: "Failed to add todo"));
    }
  }

  Future<void> deleteTodo({required String id}) async {
    try {
      await deleteTodoUsecase.call(id: id);
      await getTodos();
    } catch (e) {
      emit(TodoError(message: "Failed to delete todo"));
    }
  }

  Future<void> toggleTodoCompletion({
    required String id,
    required bool isCompleted,
  }) async {
    try {
      final currentStatue = state;
      if (currentStatue is TodoLoaded) {
        final updatedTodo =
            currentStatue.todos.map((todo) {
              if (todo.id == id) {
                return Todo(
                  id: todo.id,
                  title: todo.title,
                  isCompleted: isCompleted,
                );
              }
              return todo;
            }).toList();
        await updateTodoUsecase.call(
          todo: updatedTodo.firstWhere((todo) => todo.id == id),
        );
        await getTodos();
      }
    } catch (e) {
      emit(TodoError(message: "Failed to toggle todo completion"));
    }
  }
}
