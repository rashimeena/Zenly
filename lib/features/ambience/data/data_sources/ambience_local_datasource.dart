import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/ambience_model.dart';
import '../../domain/entities/ambience.dart';

class AmbienceLocalDataSource {
  const AmbienceLocalDataSource();

  Future<List<Ambience>> loadAmbiences() async {
    final rawJson = await rootBundle.loadString('assets/data/ambience.json');
    final decoded = jsonDecode(rawJson) as List<dynamic>;

    return decoded
        .map((item) => AmbienceModel.fromJson(item as Map<String, dynamic>))
        .cast<Ambience>()
        .toList(growable: false);
  }
}
