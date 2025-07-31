import '../../domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({
    super.id,
    required super.title,
    required super.content,
    required super.createdAt,
  });

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
