import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ristu_intern_challenge/core/shared/widgets/custom_button_widget.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';
import 'package:ristu_intern_challenge/features/survey/data/models/response/final_data_model.dart';

class ResultContent extends StatelessWidget {
  const ResultContent({
    required this.finaldata,
    super.key,
  });
  final Map<String, dynamic> finaldata;

  @override
  Widget build(BuildContext context) {
    final finalDataModel = FinalDataModel.fromJson(finaldata);
    final answers = finalDataModel.answers;

    var score = 0;

    for (final answer in answers) {
      score += int.tryParse(answer.answer) ?? 0;
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Text(
                  'Your Score',
                  style: StyleTypograph.heading1.bold,
                ),
              ),
              Expanded(
                child: Text(
                  score.toString(), // Display the total score
                  style: StyleTypograph.heading1.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButtonWidget(
                        buttonColor: Colors.blue,
                        text: 'Back',
                        textColor: Colors.white,
                        onPress: () {
                          Get.back<void>();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
