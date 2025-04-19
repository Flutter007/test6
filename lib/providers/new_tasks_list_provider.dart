import 'package:flutter/material.dart';
import 'package:test6/models/new_tasks.dart';

import '../models/task.dart';

class NewTasksListProvider extends InheritedWidget {
  final NewTasks newTasks;
  final void Function(Task task) addTask;
  final void Function(Task task) endTask;
  final void Function(Task task) deleteTask;

  const NewTasksListProvider({
    super.key,
    required super.child,
    required this.newTasks,
    required this.addTask,
    required this.endTask,
    required this.deleteTask,
  });
  static NewTasksListProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NewTasksListProvider>();
  }

  @override
  bool updateShouldNotify(NewTasksListProvider oldWidget) {
    return true;
  }
}
