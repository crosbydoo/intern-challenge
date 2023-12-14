import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ristu_intern_challenge/core/di/injections.dart';
import 'package:ristu_intern_challenge/core/shared/constant/prefs_key.dart';
import 'package:ristu_intern_challenge/core/shared/prefs/shared_preferences.dart';
import 'package:ristu_intern_challenge/core/utils/extension.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/cubit/survey_cubit.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/screens/survey_todo_screen.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/widgets/skeleton/skeleton_list_survey.dart';

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
            (index) => const SkeletonListSurvey(),
          ),
        ),
      );
    }

    if (states is GetSurveySuccess) {
      final result = states.result.data;
      final filteredResults =
          result.where((dataIndex) => dataIndex.id == 'vngzpruzso').toList();

      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(filteredResults.length, (index) {
            final dataIndex = filteredResults[index];
            final nameSurvey = dataIndex.name;
            final dateCreated = dataIndex.createdAt;
            final imageUrl = dataIndex.image;
            final uuid = dataIndex.id;

            return InkWell(
              onTap: () => Get.to<void>(
                SurveyTodoScreen(
                  uuid: uuid,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              imageUrl == ''
                                  ? 'https://d2de3f7xv7fynp.cloudfront.net/v3-staging/2023/08/Mengenal-Ghost-Call-of-Duty-1024x583.jpg'
                                  : imageUrl,
                            ),
                          ),
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nameSurvey,
                              style: StyleTypograph.body1.medium,
                            ),
                            Text(
                              'Created At: ${dateCreated.convertDate()}',
                              style: StyleTypograph.body1.medium
                                  .copyWith(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
