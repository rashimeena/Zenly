import 'package:flutter/material.dart';

class FloatingTriggerButton extends StatelessWidget {
  const FloatingTriggerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF84CCAF),
      onPressed: () {
        // navigate to session/home
      },
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}