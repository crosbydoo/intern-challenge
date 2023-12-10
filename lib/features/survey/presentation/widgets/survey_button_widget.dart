import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ristu_intern_challenge/core/shared/widgets/custom_button_widget.dart';

class SurveyButtonWidget extends StatefulWidget {
  const SurveyButtonWidget({super.key});

  @override
  State<SurveyButtonWidget> createState() => _SurveyButtonWidgetState();
}

class _SurveyButtonWidgetState extends State<SurveyButtonWidget> {
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
                Get.back<void>();
              },
            ),
          ),
          const Gap(16),
          Expanded(
            child: CustomButtonWidget(
              buttonColor: Colors.cyan,
              text: 'Next',
              textColor: Colors.white,
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
