import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/failures.dart';
import '../model/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodos();

  Future<TodoModel> getTodo({required String id});

  Future<TodoModel> createTodo({required TodoModel todo});

  Future<TodoModel> updateTodo({required TodoModel todo});

  Future<Unit> deleteTodo({required String id});
}

const String baseUrl = 'https://jsonplaceholder.typicode.com';

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final http.Client client;

  TodoRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TodoModel>> getTodos() async {
    final response = await client.get(
      Uri.parse('$baseUrl/todos'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = await json.decode(response.body);
      return data
          .map(
            (jsonItem) => TodoModel.fromJson({
          'id': jsonItem['id'].toString(),
          'title': jsonItem['title'],
          'description': 'No description provided',
          'isCompleted': jsonItem['completed'],
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': DateTime.now().toIso8601String(),
        }),
      )
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> getTodo({required String id}) async {
    final response = await client.get(
      Uri.parse('$baseUrl/todos/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return TodoModel.fromJson({
        'id': data['id'].toString(),
        'title': data['title'],
        'description': 'No description provided',
        'isCompleted': data['completed'],
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> createTodo({required TodoModel todo}) async {
    final Map<String, dynamic> requestBody = {
      'title': todo.title,
      'completed': todo.isCompleted,
    };

    final response = await client.post(
      Uri.parse('$baseUrl/todos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      return TodoModel.fromJson({
        'id': data['id'].toString(),
        'title': todo.title,
        'isCompleted': todo.isCompleted,
        'description': todo.description,
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> updateTodo({required TodoModel todo}) async {
    final Map<String, dynamic> requestBody = {
      'id': todo.id,
      'title': todo.title,
      'completed': todo.isCompleted,
    };

    final response = await client.put(
      Uri.parse('$baseUrl/todos/${todo.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return TodoModel.fromJson({
        'id': data['id'].toString(),
        'title': todo.title,
        'isCompleted': todo.isCompleted,
        'description': todo.description,
        'createdAt': todo.createdAt?.toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteTodo({required String id}) async{
    final response = await client.delete(
      Uri.parse('$baseUrl/todos/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }
}