import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/core/di/injections.dart';
import 'package:ristu_intern_challenge/core/shared/constant/prefs_key.dart';
import 'package:ristu_intern_challenge/core/shared/prefs/shared_preferences.dart';
import 'package:ristu_intern_challenge/core/shared/widgets/skeleton_widget.dart';
import 'package:ristu_intern_challenge/core/utils/extension.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/cubit/survey_cubit.dart';

class SurveyListWidget extends StatefulWidget {
  const SurveyListWidget({
    required this.state,
    super.key,
  });
  final SurveyState state;

  @override
  State<SurveyListWidget> createState() => _SurveyListWidgetState();
}

class _SurveyListWidgetState extends State<SurveyListWidget> {
  final prefs = sl<SharedPrefs>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final states = widget.state;

    if (states is SurveyLoading) {
      return SafeArea(
        child: Column(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    SkeletonLoading(
                      width: 80,
                      height: 80,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    const Gap(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonLoading(
                          width: 70,
                          height: 15,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        const Gap(20),
                        SkeletonLoading(
                          width: 180,
                          height: 15,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    if (states is GetSurveySuccess) {
      final result = states.result.data;

      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(result.length, (index) {
            final dataIndex = result[index];
            final nameSurvey = dataIndex.name;
            final dateCreated = dataIndex.createdAt;

            return Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/ph_exam.svg'),
                    const Gap(12),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(nameSurvey),
                          Text('Created At: ${dateCreated.convertDate()}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    }
    final msg = prefs.getString(PrefsKey.surveyMsg);
    return Center(child: Text('You are not $msg'));
  }
}
