import 'package:flutter/material.dart';
import 'package:test6/models/new_tasks.dart';
import 'package:test6/widgets/custom_list_tile.dart';

import '../providers/new_tasks_list_provider.dart';

class DoneTasksScreen extends StatefulWidget {
  const DoneTasksScreen({super.key});

  @override
  State<DoneTasksScreen> createState() => _DoneTasksScreenState();
}

late NewTasksListProvider provider;
late NewTasks listState;

class _DoneTasksScreenState extends State<DoneTasksScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = NewTasksListProvider.of(context)!;
    listState = provider.newTasks;
  }

  @override
  Widget build(BuildContext context) {
    final doneList = listState.newTasks.where((t) => t.done == true).toList();
    return doneList.isNotEmpty
        ? Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder:
                      (ctx, index) => CustomListTile(
                        title: doneList[index].activity,
                        subtitle: doneList[index].type,
                        endTask: () {},
                        deleteTask: () {},
                      ),
                ),
              ),
            ],
          ),
        )
        : Center(child: Text('No done tasks'));
  }
}
