class Task {
  final String activity;
  final String type;
  final String key;
  bool done;

  Task({
    required this.activity,
    required this.type,
    required this.key,
    this.done = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      activity: json['activity'],
      type: json['type'],
      key: json['key'],
    );
  }
}
