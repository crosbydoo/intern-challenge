import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/widgets/survey_list_widget.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Halaman Survei',
                  style: StyleTypograph.heading3.black,
                ),
              ),
              const Gap(16),
              const SurveyListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
