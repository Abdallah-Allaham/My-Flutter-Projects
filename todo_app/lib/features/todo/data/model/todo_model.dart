import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends Equatable{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
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