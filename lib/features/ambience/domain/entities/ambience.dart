class Ambience {
  const Ambience({
    required this.id,
    required this.title,
    required this.tag,
    required this.durationSeconds,
    required this.thumbnailAsset,
    required this.audioAsset,
    required this.description,
    required this.sensoryLayers,
  });

  final int id;
  final String title;
  final String tag;
  final int durationSeconds;
  final String thumbnailAsset;
  final String audioAsset;
  final String description;
  final List<String> sensoryLayers;

  Duration get duration => Duration(seconds: durationSeconds);

  String get durationLabel {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  factory Ambience.fromJson(Map<String, dynamic> json) {
    return Ambience(
      id: json['id'] as int,
      title: json['title'] as String,
      tag: json['tag'] as String,
      durationSeconds: json['duration'] as int,
      thumbnailAsset: json['thumbnail'] as String? ?? '',
      audioAsset: json['audio'] as String? ?? '',
      description: json['description'] as String? ?? '',
      sensoryLayers:
          (json['sensory'] as List<dynamic>? ?? const <dynamic>[]).cast<String>(),
    );
  }
}
