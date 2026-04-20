import 'package:ambience_app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:ambience_app/features/ambience/presentation/screens/ambience_home_screen.dart';

class AmbienceApp extends StatelessWidget {
  const AmbienceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambience App',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.theme,
      themeMode: ThemeMode.light,

      home: const AmbienceHomeScreen(),
    );
  }
}
