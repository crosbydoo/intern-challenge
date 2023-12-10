import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/widgets/popup_widget.dart';

class SurveyHeadingWidget extends StatefulWidget {
  const SurveyHeadingWidget({super.key});

  @override
  State<SurveyHeadingWidget> createState() => _SurveyHeadingWidgetState();
}

class _SurveyHeadingWidgetState extends State<SurveyHeadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.cyan),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '45 Second Left',
            style: StyleTypograph.label1.black.copyWith(color: Colors.cyan),
          ),
        ),
        InkWell(
          onTap: () {
            debugPrint('test');
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel:
                  MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black.withOpacity(0.5),
              pageBuilder: (context, _, __) {
                return const ShowPopup();
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.list_alt,
                  color: Colors.white,
                ),
                const Gap(8),
                Text(
                  '1/3',
                  style: StyleTypograph.label1.black.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
