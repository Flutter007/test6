import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() endTask;
  final void Function() deleteTask;
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.endTask,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: ListTile(title: Text(title), subtitle: Text(subtitle)),
          ),
          IconButton(
            onPressed: () => endTask,
            icon: Icon(Icons.stop_circle_outlined),
          ),
          IconButton(onPressed: () => deleteTask, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
