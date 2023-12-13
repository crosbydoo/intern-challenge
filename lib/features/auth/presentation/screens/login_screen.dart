import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/core/di/injections.dart';
import 'package:ristu_intern_challenge/features/auth/presentation/contents/form_content.dart';
import 'package:ristu_intern_challenge/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ristu_intern_challenge/features/auth/presentation/widgets/heading_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authCubit = sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => authCubit,
        child: const SafeArea(
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
      ),
    );
  }
}
