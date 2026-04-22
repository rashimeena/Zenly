import 'package:flutter/material.dart';

class BentoJournalCard extends StatelessWidget {
  const BentoJournalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage("https://picsum.photos/400"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text("Oct 20, 7:00 AM", style: TextStyle(color: Colors.white)),
            Text(
              "Morning Bloom",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "\"The golden hour light felt warm...\"",
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}