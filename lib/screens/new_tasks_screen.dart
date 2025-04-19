import 'package:flutter/material.dart';
import 'package:test6/providers/new_tasks_list_provider.dart';
import '../models/new_tasks.dart';
import '../models/task.dart';
import '../widgets/custom_list_tile.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  late NewTasksListProvider provider;
  late NewTasks listState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = NewTasksListProvider.of(context)!;
    listState = provider.newTasks;
  }

  void endTask(Task task) {
    provider.endTask(task);
  }

  void deleteTask(Task task) {
    provider.deleteTask(task);
  }

  @override
  Widget build(BuildContext context) {
    final tasks = listState.newTasks;
    return Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return CustomListTile(
                  title: task.activity,
                  subtitle: task.type,
                  endTask: () => endTask(task),
                  deleteTask: () => deleteTask(task),
                );
              },
              itemCount: listState.newTasks.length,
            ),
          ),
        ],
      ),
    );
  }
}
