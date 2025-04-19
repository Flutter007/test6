import 'package:test6/models/task.dart';

class NewTasks {
  List<Task> newTasks = [];
  List<Task> doneTasks = [];
  void addTask(Task task) {
    if (!newTasks.any((t) => t.key == task.key)) {
      newTasks.add(task);
    } else {
      return;
    }
  }

  void endTask(Task task) {
    task.done = true;
  }

  void deleteTask(Task task) {
    newTasks.remove(task);
  }
}
