import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_with_answer.dart';

import 'package:quiz_app/widgets/main_button.dart';
import 'package:quiz_app/utills/app_colors.dart';
import 'package:quiz_app/widgets/answer_widget_unit.dart';
import 'package:quiz_app/widgets/congrats_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionIndex = 0;
  bool isFinshed = false;
  int score = 0;
  int totalQuestions = 6;
  bool showAnswers = false;
  List<String?> selectedAnswers =
      List.filled(questionsWithAnswers.length, null);

  String? selectedAnswer;
  void answerQuestion() {
    debugPrint('Answer chosen');
  }

  @override
  Widget build(BuildContext context) {
// final questionWithAnswer1 =questionsWithAnswers[0];

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: !isFinshed
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        questionsWithAnswers[questionIndex].question,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Answer and get points!',
                        style: TextStyle(
                          color: AppColor.grey,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Step ${questionIndex + 1}',
                              style: const TextStyle(
                                color: AppColor.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                          TextSpan(
                              text: ' of $totalQuestions',
                              style: const TextStyle(
                                color: AppColor.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                        ]),
                      ),
                      const Divider(
                        color: AppColor.green,
                        thickness: 1.5,
                        height: 5,
                        endIndent: 275,
                      ),
                      Column(
                        children: questionsWithAnswers[questionIndex]
                            .answers
                            .map(
                              (answer) => AnswerWidgetItem(
                                answer: answer,
                                selectedAnswer: selectedAnswer,
                                onTap: () {
                                  setState(() {
                                    selectedAnswer = answer.text;
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                      const Spacer(),
                      MainButton(
                        text: 'Next',
                        onTap: () {
                          if (selectedAnswer == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    '!Please select an answer before proceeding!.'),
                                backgroundColor: AppColor.red,
                              ),
                            );
                            return;
                          } else {
                            setState(() {
                              selectedAnswers[questionIndex] = selectedAnswer;
                              if (selectedAnswer ==
                                  questionsWithAnswers[questionIndex]
                                      .correctAnswer) {
                                score++;
                              }
                              if (questionIndex <
                                  questionsWithAnswers.length - 1) {
                                questionIndex++;
                              } else {
                                isFinshed = true;
                              }
                              selectedAnswer = null;
                            });
                          }
                        },
                      )
                    ],
                  )
                : Column(
                    children: [
                      CongratsWidgets(
                        score: score,
                        onTap: () {
                          setState(() {
                            questionIndex = 0;
                            isFinshed = false;
                            score = 0;
                          });
                        },
                      ),
                      MainButton(
                        text: 'Show answers',
                        onTap: () {
                          setState(() {
                            showAnswers = !showAnswers;
                          });
                        },
                      ),
                      if (showAnswers)
                        Column(
                          children: [
                            // const Text(
                            //   'Your Answers:',
                            //   style: TextStyle(
                            //     fontSize: 24,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            Column(
                              children: questionsWithAnswers
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                final int index = entry.key;
                                final QuestionsWithAnswer question =
                                    entry.value;
                                final String? selectedAnswer =
                                    selectedAnswers[index];
                                final bool isCorrect =
                                    selectedAnswer == question.correctAnswer;

                                // return ListTile(
                                //   title: Text(
                                //     question.question,
                                //   ),
                                //   subtitle: Text(
                                //     'Selected Answer: ${selectedAnswer ?? 'Not answered'}',
                                //   ),
                                // );
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: isCorrect
                                        ? AppColor.green
                                        : AppColor.red,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        question.question,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Selected Answer: ${selectedAnswer ?? 'Not answered'}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
//  children: questions.map((e) => ).toList(),