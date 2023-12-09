import 'package:flutter/material.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Login to Synapsis',
        style: StyleTypograph.heading2.bold.copyWith(),
      ),
    );
  }
}
