import 'package:flutter/material.dart';
import '../models/task.dart';

class CustomListTile extends StatelessWidget {
  final Task task;
  final String title;
  final String subtitle;
  final void Function()? endTask;
  final void Function() deleteTask;
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.deleteTask,
    required this.task,
    this.endTask,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.all(10),
                child: Text(textAlign: TextAlign.start, title),
              ),
              subtitle: Text(subtitle),
            ),
          ),
          if (task.done == false)
            IconButton(
              onPressed: endTask,
              icon: Icon(Icons.done_outline_rounded),
            ),
          IconButton(onPressed: deleteTask, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
