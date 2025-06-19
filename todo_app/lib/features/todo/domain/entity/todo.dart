import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    isCompleted,
    createdAt,
    updatedAt,
  ];
}
