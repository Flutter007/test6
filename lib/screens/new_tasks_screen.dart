import 'package:flutter/material.dart';
import 'package:test6/providers/new_tasks_list_provider.dart';

import '../models/new_tasks.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder:
                  (ctx, index) => ListTile(
                    title: Text(listState.newTasks[index].activity),
                    subtitle: Text(listState.newTasks[index].type),
                  ),
              itemCount: listState.newTasks.length,
            ),
          ),
        ],
      ),
    );
  }
}
