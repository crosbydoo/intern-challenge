import 'package:flutter/material.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key});

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  final isChecked = ValueNotifier<bool>(false);
  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isChecked,
      builder: (context, value, child) {
        return Row(
          children: [
            Checkbox(
              shape: const RoundedRectangleBorder(),
              onChanged: (value) {
                isChecked.value = !isChecked.value;
              },
              value: isChecked.value,
            ),
            Text(
              'Remember Me',
              style: StyleTypograph.body1.medium,
            ),
          ],
        );
      },
    );
  }
}
