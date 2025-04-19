import 'package:flutter/material.dart';
import 'package:test6/app_routes.dart';
import 'package:test6/screens/creation_task_screen.dart';
import 'package:test6/screens/make_task_screen.dart';

class Test6 extends StatelessWidget {
  const Test6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoute.home,
      routes: {
        AppRoute.home: (context) => MakeTaskScreen(),
        AppRoute.create: (context) => CreationTaskScreen(),
      },
    );
  }
}
