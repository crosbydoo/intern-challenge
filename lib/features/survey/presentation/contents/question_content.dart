import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/core/utils/extension.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent({
    required this.nameQuestions,
    required this.questions,
    required this.number,
    super.key,
  });
  final String nameQuestions;
  final String questions;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameQuestions,
          style: StyleTypograph.heading3.bold,
        ),
        const Gap(10),
        Text(
          '$number. ${questions.toCamelCase()} ',
          style: StyleTypograph.body1.regular,
        ),
      ],
    );
  }
}
