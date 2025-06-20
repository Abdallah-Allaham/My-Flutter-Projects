import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/todo/data/repo/todo_repo_impl.dart';

import 'core/network/network_info.dart';
import 'features/todo/data/datasource/todo_local_data_source.dart';
import 'features/todo/data/datasource/todo_remote_data_source.dart';
import 'features/todo/domain/repo/todo_repo.dart';
import 'features/todo/domain/usecase/create_todo.dart';
import 'features/todo/domain/usecase/delete_todo.dart';
import 'features/todo/domain/usecase/get_todo.dart';
import 'features/todo/domain/usecase/get_todos.dart';
import 'features/todo/domain/usecase/update_todo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  sl.registerLazySingleton(() => GetTodos(todoRepo: sl()));
  sl.registerLazySingleton(() => GetTodo(todoRepo: sl()));
  sl.registerLazySingleton(() => CreateTodo(todoRepo: sl()));
  sl.registerLazySingleton(() => UpdateTodo(todoRepo: sl()));
  sl.registerLazySingleton(() => DeleteTodo(todoRepo: sl()));

  // Repo
  sl.registerLazySingleton<TodoRepo>(
    () => TodoRepoImpl(
      todoRemoteDataSource: sl(),
      todoLocalDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data source
  sl.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
}
