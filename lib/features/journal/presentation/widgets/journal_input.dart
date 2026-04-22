import 'package:flutter/material.dart';

class JournalInput extends StatelessWidget {
  final TextEditingController controller;

  const JournalInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: controller,
          maxLines: 10,
          decoration: InputDecoration(
            hintText: "Start typing your reflection here...",
            filled: true,
            fillColor: const Color(0xFFEAEBC6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(20),
          ),
        ),

        const Positioned(
          bottom: 10,
          right: 10,
          child: Icon(Icons.edit_note, size: 30, color: Colors.black26),
        ),
      ],
    );
  }
}