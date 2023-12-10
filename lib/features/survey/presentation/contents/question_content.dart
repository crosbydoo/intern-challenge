import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';

class QuestionContent extends StatefulWidget {
  const QuestionContent({super.key});

  @override
  State<QuestionContent> createState() => _QuestionContentState();
}

class _QuestionContentState extends State<QuestionContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Survei A',
          style: StyleTypograph.heading3.black,
        ),
        const Gap(10),
        Text(
          '1. Apakah anda tertarik bergabung ke synapsis',
          style: StyleTypograph.body1.medium,
        ),
      ],
    );
  }
}
