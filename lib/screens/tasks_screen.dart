import 'package:flutter/material.dart';
import 'package:test6/screens/done_tasks_screen.dart';
import 'package:test6/screens/make_task_screen.dart';
import '../providers/new_tasks_list_provider.dart';
import 'new_tasks_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void goToCreation() async {
    await Navigator.pushNamed(context, '/create');
  }

  @override
  Widget build(BuildContext context) {
    final provider = NewTasksListProvider.of(context)!;
    final newTasks = provider.newTasks.newTasks;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dont Be Bored!'),
          actions: [
            if (newTasks.isNotEmpty)
              IconButton(onPressed: goToCreation, icon: Icon(Icons.add)),
          ],
          bottom: TabBar(tabs: [Tab(text: 'New task'), Tab(text: 'Done task')]),
        ),
        body: TabBarView(
          children: [
            newTasks.isEmpty ? MakeTaskScreen() : NewTasksScreen(),
            DoneTasksScreen(),
          ],
        ),
      ),
    );
  }
}
