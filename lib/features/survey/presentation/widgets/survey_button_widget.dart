import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/core/shared/widgets/custom_button_widget.dart';

class SurveyButtonWidget extends StatefulWidget {
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
  _SurveyButtonWidgetState createState() => _SurveyButtonWidgetState();
}

class _SurveyButtonWidgetState extends State<SurveyButtonWidget> {
  bool isBackButtonPressed = false;

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
              onPress: () {
                if (!isBackButtonPressed) {
                  setState(() {
                    isBackButtonPressed = true;
                  });
                  widget.onBackPressed();
                }
              },
            ),
          ),
          const Gap(16),
          Expanded(
            child: CustomButtonWidget(
              buttonColor: Colors.cyan,
              text: widget.isLastQuestion ? 'Finish' : 'Next',
              textColor: Colors.white,
              onPress: widget.isLastQuestion
                  ? widget.onFinishPressed
                  : widget.onNextPressed,
            ),
          ),
        ],
      ),
    );
  }
}
