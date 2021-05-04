import 'package:flutter/material.dart';

class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  Todo({
    @required this.id, 
    @required this.completed,
    @required this.userId,
    @required this.title,
    });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }
}
