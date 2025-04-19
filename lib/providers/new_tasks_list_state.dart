import 'package:flutter/material.dart';
import 'package:test6/models/new_tasks.dart';
import 'package:test6/providers/new_tasks_list_provider.dart';

import '../models/task.dart';

class NewTasksListState extends StatefulWidget {
  final Widget child;
  const NewTasksListState({super.key, required this.child});

  @override
  State<NewTasksListState> createState() => _NewTasksListStateState();
}

class _NewTasksListStateState extends State<NewTasksListState> {
  final newTasks = NewTasks();

  void addTask(Task task) {
    setState(() {
      newTasks.addTask(task);
    });
  }

  void endTask(Task task) {
    setState(() {
      task.done = true;
    });
  }

  void deleteTask(Task task) {
    setState(() {
      newTasks.deleteTask(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NewTasksListProvider(
      newTasks: newTasks,
      addTask: addTask,
      endTask: endTask,
      deleteTask: deleteTask,
      child: widget.child,
    );
  }
}
