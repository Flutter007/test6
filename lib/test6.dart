import 'package:flutter/material.dart';
import 'package:test6/app_routes.dart';
import 'package:test6/providers/new_tasks_list_state.dart';
import 'package:test6/screens/creation_task_screen.dart';

import 'package:test6/screens/tasks_screen.dart';

class Test6 extends StatelessWidget {
  const Test6({super.key});

  @override
  Widget build(BuildContext context) {
    return NewTasksListState(
      child: MaterialApp(
        initialRoute: AppRoute.home,
        routes: {
          AppRoute.home: (context) => TasksScreen(),
          AppRoute.create: (context) => CreationTaskScreen(),
        },
      ),
    );
  }
}
