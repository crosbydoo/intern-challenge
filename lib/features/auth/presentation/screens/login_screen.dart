import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/features/auth/presentation/contents/form_content.dart';
import 'package:ristu_intern_challenge/features/auth/presentation/widgets/heading_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingWidget(),
              Gap(24),
              FormContent(),
            ],
          ),
        ),
      ),
    );
  }
}
