import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/todo_cubit.dart';
import '../cubit/todo_state.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter a task',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _controller.text = value;
                      _controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: _controller.text.length),
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      context.read<TodoCubit>().addTodo(title: _controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                if (state is TodoLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TodoLoaded) {
                  return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return ListTile(
                        key: ValueKey(todo.id), // لتحسين الأداء
                        leading: Checkbox(
                          value: todo.isCompleted,
                          onChanged: (value) {
                            context.read<TodoCubit>().toggleTodoCompletion(
                              id: todo.id,
                              isCompleted: value ?? false,
                            );
                          },
                        ),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _showEditDialog(context, todo.id, todo.title);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                context.read<TodoCubit>().deleteTodo(id: todo.id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is TodoError) {
                  return Center(child: Text(state.message));
                }
                return Center(child: Text('Press the button to load todos'));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('refresh');
          context.read<TodoCubit>().getTodos();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  void _showEditDialog(BuildContext context, String id, String currentTitle) {
    final editController = TextEditingController(text: currentTitle);
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Builder(
          builder: (dialogContext) {
            return AlertDialog(
              title: Text('Edit Todo'),
              content: TextField(
                controller: editController,
                decoration: InputDecoration(
                  hintText: 'Enter new title',
                  border: OutlineInputBorder(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (editController.text.isNotEmpty) {
                      dialogContext.read<TodoCubit>().updateTodo(
                        id: id,
                        newTitle: editController.text,
                      );
                      Navigator.of(dialogContext).pop();
                    } else {
                      ScaffoldMessenger.of(dialogContext).showSnackBar(
                        SnackBar(
                          content: Text('Title cannot be empty'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}