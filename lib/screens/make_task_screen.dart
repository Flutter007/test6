import 'package:flutter/material.dart';

import '../app_routes.dart';

class MakeTaskScreen extends StatelessWidget {
  const MakeTaskScreen({super.key});

  void goToCreation(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.create);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => goToCreation(context),
              child: Text(
                'Create new Task!',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
