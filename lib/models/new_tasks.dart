import 'package:test6/models/task.dart';

class NewTasks {
  List<Task> newTasks = [];
  int counter = 0;
  void addTask(Task task) {
    if (!newTasks.any((t) => t.key == task.key)) {
      newTasks.add(task);
    } else {
      return;
    }
  }

  void endTask(Task task) {
    task.done = !task.done;
    counter++;
  }

  void deleteTask(Task task) {
    newTasks.remove(task);
  }
}
