import 'package:flutter/material.dart';
import 'package:test6/helpers/request.dart';
import 'package:test6/models/activity_type.dart';
import 'package:test6/models/task.dart';
import '../models/new_tasks.dart';
import '../providers/new_tasks_list_provider.dart';

class CreationTaskScreen extends StatefulWidget {
  const CreationTaskScreen({super.key});

  @override
  State<CreationTaskScreen> createState() => _CreationTaskScreenState();
}

class _CreationTaskScreenState extends State<CreationTaskScreen> {
  String? selectedType = 'activity';
  Task? task;
  bool isLoading = false;
  String? error;
  late NewTasksListProvider provider;
  late NewTasks listState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = NewTasksListProvider.of(context)!;
    listState = provider.newTasks;
  }

  void addTask(Task task) {
    provider.addTask(task);
  }

  Future<void> goToTasksScreen() async {
    await Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  Future<void> getTask() async {
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      final url =
          selectedType == 'activity'
              ? 'https://bored.api.lewagon.com/api/activity'
              : 'https://bored.api.lewagon.com/api/activity?type=$selectedType';

      final data = await request(url);
      final newTask = Task.fromJson(data);
      setState(() {
        task = newTask;
        isLoading = false;
      });
      addTask(newTask);
      await goToTasksScreen();
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int doneCounter = provider.newTasks.counter;
    Widget content;
    if (isLoading) {
      content = const Center(child: CircularProgressIndicator());
    } else if (error != null) {
      content = Center(child: Text('Error: $error'));
    } else {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownMenu(
              label: const Text('Choose type:'),
              initialSelection: selectedType,
              onSelected:
                  (value) => setState(() {
                    selectedType = value;
                  }),
              dropdownMenuEntries:
                  activityTypes
                      .map(
                        (t) => DropdownMenuEntry(
                          value: t.id,
                          label: t.title,
                          leadingIcon: Icon(t.icon),
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: isLoading ? null : getTask,
              child: Text(
                'Get Task',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('Create new task! -⚡:$doneCounter')),
      body: content,
    );
  }
}
