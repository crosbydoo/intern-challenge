import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ristu_intern_challenge/core/di/injections.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/contents/answer_content.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/cubit/survey_cubit.dart';

class SurveyTodoScreen extends StatefulWidget {
  const SurveyTodoScreen({required this.uuid, super.key});

  final String uuid;

  @override
  State<SurveyTodoScreen> createState() => _SurveyTodoScreenState();
}

class _SurveyTodoScreenState extends State<SurveyTodoScreen> {
  final detailSurveyCubit = sl<SurveyCubit>();

  @override
  void initState() {
    detailSurveyCubit.getQuestion(widget.uuid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detailSurveyCubit,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SurveyCubit, SurveyState>(
            builder: (context, state) {
              if (state is GetDetailSurveySuccess) {
                final data = state.result.data;

                final questions = data.question;
                final name = data.name;

                return AnswerContent(
                  questions: questions,
                  nameQuestion: name,
                  surveyId: widget.uuid,
                );
              }
              return Container();
              //
            },
          ),
        ),
      ),
    );
  }
}
