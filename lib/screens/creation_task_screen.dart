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
  bool isLoading = true;
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
    setState(() {
      listState.addTask(task);
    });
  }

  void goToTasksScreen() async {
    await Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void getTask() async {
    try {
      final url =
          selectedType == 'activity'
              ? 'https://bored.api.lewagon.com/api/activity'
              : 'https://bored.api.lewagon.com/api/activity?type=$selectedType';
      final data = await request(url);
      setState(() {
        task = Task.fromJson(data);
        isLoading = false;
      });
      addTask(task!);
      goToTasksScreen();
    } catch (e) {
      error = e.toString();
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (isLoading && task != null) {
      content = Center(child: CircularProgressIndicator());
    } else if (error != null) {
      content = Text('Error : $error');
    } else {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: DropdownMenu(
                label: Text('Choose type :'),
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
            ),
            ElevatedButton(
              onPressed: getTask,
              child: Text(isLoading ? 'Get Task' : 'Loading...'),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('Create new task!')),
      body: content,
    );
  }
}
