import 'package:flutter/material.dart';
import 'package:test6/models/new_tasks.dart';
import 'package:test6/widgets/custom_list_tile.dart';
import '../models/task.dart';
import '../providers/new_tasks_list_provider.dart';

class DoneTasksScreen extends StatefulWidget {
  const DoneTasksScreen({super.key});

  @override
  State<DoneTasksScreen> createState() => _DoneTasksScreenState();
}

class _DoneTasksScreenState extends State<DoneTasksScreen> {
  late NewTasksListProvider provider;
  late NewTasks listState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = NewTasksListProvider.of(context)!;
    listState = provider.newTasks;
  }

  void deleteTask(Task task) {
    provider.deleteTask(task);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final doneList = listState.newTasks.where((t) => t.done == true).toList();
    return doneList.isNotEmpty
        ? Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder:
                      (ctx, index) => CustomListTile(
                        task: doneList[index],
                        title: doneList[index].activity,
                        subtitle: doneList[index].type,
                        deleteTask: () => deleteTask(doneList[index]),
                      ),
                  itemCount: doneList.length,
                ),
              ),
            ],
          ),
        )
        : Center(
          child: Text(
            'No done tasks!\nDo something!',
            style: theme.textTheme.titleLarge,
          ),
        );
  }
}
