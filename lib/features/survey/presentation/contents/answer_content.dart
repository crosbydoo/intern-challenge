// ignore_for_file: inference_failure_on_collection_literal

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:ristu_intern_challenge/core/utils/typograph.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/detail_survey_entity.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/contents/question_content.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/contents/results_content.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/widgets/popup_widget.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/widgets/survey_button_widget.dart';

class AnswerContent extends StatefulWidget {
  const AnswerContent({
    required this.questions,
    required this.nameQuestion,
    required this.surveyId,
    super.key,
  });
  final List<Question> questions;
  final String nameQuestion;
  final String surveyId;

  @override
  State<AnswerContent> createState() => _AnswerContentState();
}

class _AnswerContentState extends State<AnswerContent> {
  late int secondsRemaining;
  late Timer timer;
  late ValueNotifier<int> secondsNotifier;
  late Map<String, dynamic> responseJson = {
    'survey_id': '',
    'answers': [],
  };

  Question? selectedQuestion;
  String? selectedRadioValue;
  Set<String> selectedRadioValues = <String>{};

  @override
  void initState() {
    super.initState();
    secondsRemaining = 10;
    secondsNotifier = ValueNotifier<int>(secondsRemaining);
    startTimer();

    if (widget.questions.isNotEmpty) {
      selectedQuestion = widget.questions.first;

      _saveAnswerPoints();
    }
  }

  @override
  void dispose() {
    timer.cancel();
    secondsNotifier.dispose();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        secondsNotifier.value = secondsRemaining;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder(
                valueListenable: secondsNotifier,
                builder: (context, value, child) {
                  if (value <= 0) {
                    Future.delayed(Duration.zero, moveToNextQuestion);
                  }
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: value <= 10 ? Colors.red : Colors.cyan,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$value Seconds Left',
                      style: StyleTypograph.body1.bold.copyWith(
                        color: value <= 10 ? Colors.red : Colors.cyan,
                      ),
                    ),
                  );
                },
              ),
              InkWell(
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (context, animation1, animation2) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: SafeArea(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Survei Question',
                                      style:
                                          StyleTypograph.heading3.bold.copyWith(
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    const Gap(16),
                                    Center(
                                      child: ShowPopup(
                                        data: widget.questions,
                                        onItemSelected: (question) {
                                          setState(() {
                                            selectedQuestion = question;
                                            secondsRemaining = 10;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ).then((_) {
                    if (secondsNotifier.value <= 0) {
                      moveToNextQuestion();
                    }
                  });
                },
                child: ValueListenableBuilder(
                  valueListenable: secondsNotifier,
                  builder: (context, value, child) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.list_alt,
                                color: Colors.white,
                                size: 25,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${widget.questions.indexOf(selectedQuestion!) + 1}/${widget.questions.length}',
                                style: StyleTypograph.body1.bold.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: QuestionContent(
            nameQuestions: widget.nameQuestion,
            questions: selectedQuestion!.questionName,
            number: selectedQuestion!.number,
          ),
        ),
        const Gap(16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text(
                  'Answer',
                  style: StyleTypograph.heading3.medium,
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(0.2),
              ),
              if (selectedQuestion != null) ...[
                if (selectedQuestion!.type == 'multiple_choice')
                  Column(
                    children: List.generate(selectedQuestion!.options.length,
                        (index) {
                      final dataOption = selectedQuestion!.options[index];
                      final nameOption = dataOption.optionName;

                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(nameOption),
                        value: selectedRadioValues.contains(index.toString()),
                        onChanged: (value) {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              if (value != null && value) {
                                selectedRadioValues.add(index.toString());
                              } else {
                                selectedRadioValues.remove(index.toString());
                              }
                            });
                          });
                        },
                      );
                    }),
                  )
                else
                  Column(
                    children: List.generate(selectedQuestion!.options.length,
                        (index) {
                      final dataOption = selectedQuestion!.options[index];
                      final nameOption = dataOption.optionName;

                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(nameOption),
                        value: index.toString() == selectedRadioValue,
                        onChanged: (value) {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              if (value != null && value) {
                                selectedRadioValue = index.toString();
                              } else {
                                selectedRadioValue = null;
                              }
                            });
                          });
                        },
                      );
                    }),
                  ),
              ],
            ],
          ),
        ),
        SurveyButtonWidget(
          onNextPressed: moveToNextQuestion,
          onBackPressed: moveToPreviousQuestion,
          onFinishPressed: onFinishSurvey,
          isLastQuestion: _isLastQuestion(),
        ),
      ],
    );
  }

  bool _isLastQuestion() {
    final currentIndex = widget.questions.indexOf(selectedQuestion!);
    return currentIndex == widget.questions.length - 1;
  }

  void moveToPreviousQuestion() {
    final currentIndex = widget.questions.indexOf(selectedQuestion!);
    if (currentIndex > 0) {
      setState(() {
        selectedQuestion = widget.questions[currentIndex - 1];
        secondsRemaining = 10;
        selectedRadioValue = null;
        selectedRadioValues.clear();
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  void moveToNextQuestion() {
    final currentIndex = widget.questions.indexOf(selectedQuestion!);

    if (selectedQuestion!.scoring) {
      _saveAnswerPoints();
    }

    if (currentIndex == widget.questions.length - 1 && secondsRemaining <= 0) {
      if (selectedQuestion!.scoring) {
        Get.off<void>(
          () => ResultContent(
            finaldata: responseJson,
          ),
        );
      }
    } else {
      setState(() {
        if (currentIndex < widget.questions.length - 1) {
          selectedQuestion = widget.questions[currentIndex + 1];
          secondsRemaining = 10;
          selectedRadioValue = null;
          selectedRadioValues.clear();
        }
      });
    }
  }

  void _saveAnswerPoints() {
    final answerList = <Map<String, dynamic>>[];

    if (selectedQuestion!.type == 'multiple_choice') {
      for (final index in selectedRadioValues) {
        final optionIndex = int.parse(index);
        final dataOption = selectedQuestion!.options[optionIndex];
        final questionId = selectedQuestion!.questionid;
        final answer = dataOption.points.toString();

        answerList.add({
          'question_id': questionId,
          'answer': answer,
        });
      }
    } else {
      if (selectedRadioValue != null) {
        final optionIndex = int.parse(selectedRadioValue!);
        final dataOption = selectedQuestion!.options[optionIndex];
        final questionId = selectedQuestion!.questionid;
        final answer = dataOption.points.toString();

        answerList.add({
          'question_id': questionId,
          'answer': answer,
        });
      }
    }

    responseJson = <String, dynamic>{
      'survey_id': widget.surveyId,
      'answers': answerList,
    };

    print('check hasil akhir $responseJson');
  }

  void onFinishSurvey() {
    Get.off<void>(
      () => ResultContent(
        finaldata: responseJson,
      ),
    );
  }
}
