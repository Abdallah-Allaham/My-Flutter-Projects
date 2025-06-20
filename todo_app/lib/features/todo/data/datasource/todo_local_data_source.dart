import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failures.dart';
import '../model/todo_model.dart';

const CACHE_TODOS = 'CACHED_TODOS';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> getCachedTodos();

  Future<void> cacheTodos(List<TodoModel> todos);

  Future<Unit> clearCache();
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences sharedPreferences;

  TodoLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TodoModel>> getCachedTodos() {
    final jsonString = sharedPreferences.getString(CACHE_TODOS);
    if (jsonString != null) {
      final List<dynamic> data = json.decode(jsonString);
      return Future.value(
        data.map((json) => TodoModel.fromJson(json)).toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheTodos(List<TodoModel> todos) {
    return sharedPreferences.setString(
      CACHE_TODOS,
      json.encode(todos.map((todo) => todo.toJson()).toList()),
    );
  }

  @override
  Future<Unit> clearCache() {
    sharedPreferences.remove(CACHE_TODOS);
    return Future.value(unit);
  }
}