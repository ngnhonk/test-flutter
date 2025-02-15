import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String title;
  String content;
  bool isMarked;
  DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    required this.content,
    this.isMarked = false,
    required this.createdAt,
  });

  // Phương thức copyWith
  Task copyWith({
    String? id,
    String? title,
    String? content,
    bool? isMarked,
    DateTime? createdAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isMarked: isMarked ?? this.isMarked,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Task.fromMap(Map<String, dynamic> data, String id) {
    return Task(
      id: id,
      title: data['title'],
      content: data['content'],
      isMarked: data['isMarked'] ?? false,
      createdAt: data['createdAt'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'isMarked': isMarked,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}