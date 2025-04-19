import 'package:flutter/material.dart';

import '../app_routes.dart';

class MakeTaskScreen extends StatelessWidget {
  const MakeTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void goToCreation() {
      Navigator.pushNamed(context, AppRoute.create);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: goToCreation,
              child: Text('Create new Task!'),
            ),
          ],
        ),
      ),
    );
  }
}
