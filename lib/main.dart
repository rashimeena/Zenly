import 'package:ambience_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/journal/data/models/journal_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Register Adapters
  Hive.registerAdapter(JournalModelAdapter());
  
  // Open Boxes
  final journalBox = await Hive.openBox<JournalModel>('journalBox');
  
  runApp(AmbienceApp(journalBox: journalBox));
}