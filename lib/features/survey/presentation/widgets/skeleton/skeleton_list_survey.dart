import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/core/shared/widgets/skeleton_widget.dart';

class SkeletonListSurvey extends StatelessWidget {
  const SkeletonListSurvey({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
