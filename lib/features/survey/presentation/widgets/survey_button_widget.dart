import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/core/shared/widgets/custom_button_widget.dart';

class SurveyButtonWidget extends StatelessWidget {
  const SurveyButtonWidget({
    required this.onNextPressed,
    required this.onBackPressed,
    required this.onFinishPressed,
    required this.isLastQuestion,
    super.key,
  });
  final VoidCallback onNextPressed;
  final VoidCallback onBackPressed;
  final VoidCallback onFinishPressed;
  final bool isLastQuestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: CustomButtonWidget(
              buttonColor: Colors.white,
              text: 'Back',
              textColor: Colors.cyan,
              onPress: onBackPressed,
            ),
          ),
          const Gap(16),
          Expanded(
            child: CustomButtonWidget(
              buttonColor: Colors.cyan,
              text: isLastQuestion ? 'Finish' : 'Next',
              textColor: Colors.white,
              onPress: isLastQuestion ? onFinishPressed : onNextPressed,
            ),
          ),
        ],
      ),
    );
  }
}
