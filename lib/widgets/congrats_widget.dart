import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_with_answer.dart';

class CongratsWidgets extends StatelessWidget {
  final int score;
  final VoidCallback onTap;

  const CongratsWidgets({
    super.key,
    required this.score,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '🎉 Congratulations 🎉',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Your score : $score/${questionsWithAnswers.length}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: onTap,
          child: const Text("Reset Quiz"),
        ),
        // const SizedBox(height: 300),
      ],
    );
  }
}
