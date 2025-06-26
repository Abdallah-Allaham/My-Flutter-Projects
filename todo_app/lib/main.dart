import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/presentation/screen/todo_screen.dart';
import 'features/todo/presentation/cubit/todo_cubit.dart';
import 'injection_container.dart' as di;

void main(){
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: BlocProvider(
        create: (_) =>di.sl<TodoCubit>()..getTodos(),
        child: TodoScreen(),
      ),
    );
  }
}
