import 'package:flutter/material.dart';
import 'package:test6/screens/make_task_screen.dart';
import '../providers/new_tasks_list_provider.dart';
import 'new_tasks_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = NewTasksListProvider.of(context)!;
    final listState = provider.newTasks;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dont Be Bored!'),
          bottom: TabBar(tabs: [Tab(text: 'New task'), Tab(text: 'Done task')]),
        ),
        body: TabBarView(
          children: [
            listState.newTasks.isEmpty ? MakeTaskScreen() : NewTasksScreen(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
