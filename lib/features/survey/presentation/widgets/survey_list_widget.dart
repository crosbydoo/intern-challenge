import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SurveyListWidget extends StatefulWidget {
  const SurveyListWidget({super.key});

  @override
  State<SurveyListWidget> createState() => _SurveyListWidgetState();
}

class _SurveyListWidgetState extends State<SurveyListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/ph_exam.svg'),
          const Gap(12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('A'),
              Text('Created At: 23 Jan 2023'),
            ],
          ),
        ],
      ),
    );
  }
}
