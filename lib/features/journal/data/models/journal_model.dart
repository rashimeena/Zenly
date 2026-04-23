// ignore_for_file: overridden_fields
import 'package:hive/hive.dart';
import '../../domain/entities/journal_entity.dart';

part 'journal_model.g.dart';

@HiveType(typeId: 0)
class JournalModel extends JournalEntity {
  @override
  @HiveField(0)
  final String id;
  
  @override
  @HiveField(1)
  final String title;
  
  @override
  @HiveField(2)
  final String content;
  
  @override
  @HiveField(3)
  final String mood;
  
  @override
  @HiveField(4)
  final DateTime createdAt;

  const JournalModel({
    required this.id,
    required this.title,
    required this.content,
    required this.mood,
    required this.createdAt,
  }) : super(
          id: id,
          title: title,
          content: content,
          mood: mood,
          createdAt: createdAt,
        );

  factory JournalModel.fromEntity(JournalEntity entity) {
    return JournalModel(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      mood: entity.mood,
      createdAt: entity.createdAt,
    );
  }

  JournalEntity toEntity() {
    return JournalEntity(
      id: id,
      title: title,
      content: content,
      mood: mood,
      createdAt: createdAt,
    );
  }
}
