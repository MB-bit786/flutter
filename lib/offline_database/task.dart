class Task {
  int? id;
  String name;
  String description;
  String date;
  String time;
  String priority;
  int isCompleted; // 0 = pending, 1 = completed

  Task({
    this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.priority,
    this.isCompleted = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'time': time,
      'priority': priority,
      'isCompleted': isCompleted,
    };
  }
}