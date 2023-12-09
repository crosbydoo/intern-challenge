import 'package:flutter/material.dart';

class CustomFormWidget extends StatefulWidget {
  const CustomFormWidget({
    required this.obscuredText,
    required this.hintText,
    super.key,
  });

  final bool obscuredText;
  final String hintText;

  @override
  State<CustomFormWidget> createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormWidget> {
  final showPassword = ValueNotifier<bool>(true);

  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: showPassword,
          builder: (context, value, child) {
            return TextFormField(
              obscureText: widget.obscuredText
                  ? showPassword.value
                  : !showPassword.value,
              decoration: InputDecoration(
                suffixIcon: widget.obscuredText
                    ? IconButton(
                        onPressed: togglePasswordVisibility,
                        icon: Icon(
                          showPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      )
                    : null,
                hintText: widget.hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
