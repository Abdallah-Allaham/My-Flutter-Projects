import 'package:get_it/get_it.dart';

import 'features/todo/data/datasource/todo_local_data_source.dart';
import 'features/todo/data/repo/todo_repo_impl.dart';
import 'features/todo/domain/repo/todo_repo.dart';
import 'features/todo/domain/usecase/add_todo_usecase.dart';
import 'features/todo/domain/usecase/delete_todo_usecase.dart';
import 'features/todo/domain/usecase/get_todos_usecase.dart';
import 'features/todo/presentation/cubit/todo_cubit.dart';

final sl = GetIt.instance;

void init() {
  // Data Source
  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(),
  );

  // Repositories
  sl.registerLazySingleton<TodoRepo>(
    () => TodoRepoImpl(todoLocalDataSource: sl()),
  );

  // Use Case
  sl.registerLazySingleton(() => GetTodosUsecase(todoRepo: sl()));
  sl.registerLazySingleton(() => AddTodoUsecase(todoRepo: sl()));
  sl.registerLazySingleton(() => DeleteTodoUsecase(todoRepo: sl()));

  // Cubit
  sl.registerFactory(
    () => TodoCubit(
      getTodosUsecase: sl(),
      addTodoUsecase: sl(),
      deleteTodoUsecase: sl(),
    ),
  );
}
