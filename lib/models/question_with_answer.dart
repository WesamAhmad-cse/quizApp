// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QuestionsWithAnswer {
  final String question;
  final List<Answer> answers;
  final String correctAnswer;

  QuestionsWithAnswer({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

class Answer {
  final String text;
  final IconData icon;
  Answer({
    required this.text,
    required this.icon,
  });
}

List<QuestionsWithAnswer> questionsWithAnswers = [
  QuestionsWithAnswer(
    question: 'What is the capital of Palestine?',
    answers: [
      Answer(
        text: 'Ramallah',
        icon: Icons.location_city,
      ),
      Answer(
        text: 'Nablus',
        icon: Icons.location_city,
      ),
      Answer(
        text: 'Jerusalem',
        icon: Icons.location_city,
      ),
    ],
    correctAnswer: 'Jerusalem',
  ),
  QuestionsWithAnswer(
    question: 'Who created Flutter?',
    answers: [
      Answer(
        text: 'Facebook',
        icon: Icons.add,
      ),
      Answer(
        text: 'Google',
        icon: Icons.add,
      ),
      Answer(
        text: 'Microsoft',
        icon: Icons.add,
      ),
    ],
    correctAnswer: 'Google',
  ),
  QuestionsWithAnswer(
    question: 'Which programming language is used by Flutter?',
    answers: [
      Answer(
        text: 'Ruby',
        icon: Icons.code,
      ),
      Answer(
        text: 'Dart',
        icon: Icons.code_off,
      ),
      Answer(
        text: 'Kotlin',
        icon: Icons.code,
      ),
    ],
    correctAnswer: 'Dart',
  ),
];
