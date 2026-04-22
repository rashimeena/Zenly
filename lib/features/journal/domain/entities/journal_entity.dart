import 'package:equatable/equatable.dart';

class JournalEntity extends Equatable {
  final String id;
  final String title;
  final String content;
  final String mood;
  final DateTime createdAt;

  const JournalEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.mood,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, content, mood, createdAt];
}
