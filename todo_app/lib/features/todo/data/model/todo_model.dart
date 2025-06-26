import 'package:equatable/equatable.dart';

class TodoModel extends Equatable{
  final String id;
  final String title;
  final bool isCompleted;

  const TodoModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  factory TodoModel.fromJson({required Map<String, dynamic> json}) => TodoModel(
    id: json['id'],
    title: json['title'],
    isCompleted: json['isCompleted'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'isCompleted': isCompleted,
  };

  @override
  List<Object?> get props => [id, title, isCompleted];
}