import 'package:flutter/material.dart';
import 'package:test6/models/new_tasks.dart';

import '../models/task.dart';

class NewTasksListProvider extends InheritedWidget {
  final NewTasks newTasks;
  final void Function(Task) addTask;
  final void Function(Task)? endTask;
  final void Function(Task) deleteTask;

  const NewTasksListProvider({
    super.key,
    required super.child,
    required this.newTasks,
    required this.addTask,
    required this.deleteTask,
    this.endTask,
  });
  static NewTasksListProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NewTasksListProvider>();
  }

  @override
  bool updateShouldNotify(NewTasksListProvider oldWidget) {
    return true;
  }
}
