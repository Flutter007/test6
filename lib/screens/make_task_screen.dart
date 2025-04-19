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
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/images/notebook.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
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
