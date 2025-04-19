import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dont Be Bored!'),
          bottom: TabBar(tabs: [Tab(text: 'New task'), Tab(text: 'Done task')]),
        ),
        body: TabBarView(children: []),
      ),
    );
  }
}
