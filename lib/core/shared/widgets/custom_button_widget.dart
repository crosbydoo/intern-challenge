import 'package:flutter/material.dart';

import 'package:ristu_intern_challenge/core/utils/typograph.dart';

class CustomButtonWidget extends StatefulWidget {
  const CustomButtonWidget({
    required this.text,
    required this.buttonColor,
    required this.textColor,
    required this.onPress,
    super.key,
  });
  final String text;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPress;

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.buttonColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.cyan),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          minimumSize: const Size(double.infinity, double.minPositive),
        ),
        onPressed: widget.onPress,
        child: Text(
          widget.text,
          style: StyleTypograph.body1.bold.copyWith(color: widget.textColor),
        ),
      ),
    );
  }
}
