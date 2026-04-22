import 'package:flutter/material.dart';

class JournalInput extends StatelessWidget {
  const JournalInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          maxLines: 10,
          decoration: InputDecoration(
            hintText: "Start typing your reflection here...",
            filled: true,
            fillColor: const Color(0xFFEAEBC6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
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