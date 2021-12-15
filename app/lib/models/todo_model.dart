class TodoModel {
  String id;
  bool isDone;
  String title, description;
  DateTime? deadline;
  DateTime updatedAt;
  final DateTime createdAt;
  TodoModel({
    required this.id,
    this.isDone = false,
    required this.title,
    this.description = "",
    this.deadline,
    required this.createdAt,
    required this.updatedAt,
  });
}
