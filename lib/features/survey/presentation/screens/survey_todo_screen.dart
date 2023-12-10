import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/contents/answer_content.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/contents/question_content.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/widgets/survey_button_widget.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/widgets/survey_heading_widget.dart';

class SurveyTodoScreen extends StatefulWidget {
  const SurveyTodoScreen({super.key});

  @override
  State<SurveyTodoScreen> createState() => _SurveyTodoScreenState();
}

class _SurveyTodoScreenState extends State<SurveyTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SurveyHeadingWidget(),
                  Gap(20),
                  QuestionContent(),
                  Gap(16),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration:
                  BoxDecoration(color: Colors.blueAccent.withOpacity(0.3)),
            ),
            const Expanded(child: AnswerContent()),
            const SurveyButtonWidget(),
          ],
        ),
      ),
    );
  }
}
