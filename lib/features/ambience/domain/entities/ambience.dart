class Ambience {
  const Ambience({
    required this.id,
    required this.title,
    required this.tag,
    required this.duration,
    required this.thumbnail,
    required this.audio,
    required this.description,
    required this.sensory,
  });

  final int id;
  final String title;
  final String tag;
  final int duration;
  final String thumbnail;
  final String audio;
  final String description;
  final List<String> sensory;

  String get durationLabel => '${(duration / 60).round()} min';

  String get durationClockLabel {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
