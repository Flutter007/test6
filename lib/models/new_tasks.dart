import 'package:test6/models/task.dart';

class NewTasks {
  List<Task> newTasks = [];

  void addTask(Task task) {
    if (!newTasks.any((t) => t.key == task.key)) {
      newTasks.add(task);
    } else {
      return;
    }
  }

  void endTask(Task task) {
    task.done = !task.done;
  }

  void deleteTask(Task task) {
    newTasks.remove(task);
  }
}
