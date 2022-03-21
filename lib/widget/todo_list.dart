import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//model
import 'package:to_do/provider/todos.dart'; //provider
import 'package:to_do/widget/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? const Center(
            child: Text('No todos.', style: TextStyle(fontSize: 20)),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
            separatorBuilder: (BuildContext context, int index) =>
                Container(height: 8),
          );
  }
}
