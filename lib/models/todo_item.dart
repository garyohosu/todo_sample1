import 'package:hive/hive.dart';

part 'todo_item.g.dart';

@HiveType(typeId: 0)
class TodoItem extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String? detail;

  @HiveField(3)
  DateTime? deadline;

  @HiveField(4)
  int priority; // 0: low, 1: middle, 2: high

  @HiveField(5)
  bool isDone;

  @HiveField(6)
  DateTime createdAt;

  @HiveField(7)
  List<String>? tags;

  TodoItem({
    required this.id,
    required this.title,
    this.detail,
    this.deadline,
    this.priority = 1,
    this.isDone = false,
    DateTime? createdAt,
    this.tags,
  }) : createdAt = createdAt ?? DateTime.now();

  // JSON serialization
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'detail': detail,
        'deadline': deadline?.toIso8601String(),
        'priority': priority,
        'isDone': isDone,
        'createdAt': createdAt.toIso8601String(),
        'tags': tags,
      };

  factory TodoItem.fromJson(Map<String, dynamic> json) => TodoItem(
        id: json['id'],
        title: json['title'],
        detail: json['detail'],
        deadline: json['deadline'] != null 
            ? DateTime.parse(json['deadline']) 
            : null,
        priority: json['priority'] ?? 1,
        isDone: json['isDone'] ?? false,
        createdAt: DateTime.parse(json['createdAt']),
        tags: json['tags'] != null 
            ? List<String>.from(json['tags']) 
            : null,
      );

  TodoItem copyWith({
    String? id,
    String? title,
    String? detail,
    DateTime? deadline,
    int? priority,
    bool? isDone,
    DateTime? createdAt,
    List<String>? tags,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      detail: detail ?? this.detail,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
      tags: tags ?? this.tags,
    );
  }
}