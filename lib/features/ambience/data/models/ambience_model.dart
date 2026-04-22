import '../../domain/entities/ambience.dart';

class AmbienceModel extends Ambience {
  const AmbienceModel({
    required super.id,
    required super.title,
    required super.tag,
    required super.duration,
    required super.thumbnail,
    required super.audio,
    required super.description,
    required super.sensory,
  });

  factory AmbienceModel.fromJson(Map<String, dynamic> json) {
    return AmbienceModel(
      id: json['id'] as int,
      title: json['title'] as String,
      tag: json['tag'] as String,
      duration: json['duration'] as int,
      thumbnail: json['thumbnail'] as String? ?? '',
      audio: json['audio'] as String? ?? '',
      description: json['description'] as String? ?? '',
      sensory: List<String>.from(json['sensory'] as List<dynamic>? ?? const []),
    );
  }
}
