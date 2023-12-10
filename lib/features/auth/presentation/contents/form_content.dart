import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ristu_intern_challenge/core/shared/widgets/custom_button_widget.dart';
import 'package:ristu_intern_challenge/core/shared/widgets/custom_form_widget.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';
import 'package:ristu_intern_challenge/features/auth/presentation/widgets/checkbox_widget.dart';

class FormContent extends StatefulWidget {
  const FormContent({super.key});

  @override
  State<FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email'),
          const Gap(4),
          const CustomFormWidget(
            obscuredText: false,
            hintText: 'intern@synapsis.com',
          ),
          const Gap(16),
          const Text('Password'),
          const Gap(4),
          const CustomFormWidget(
            obscuredText: true,
            hintText: '*******',
          ),
          const CheckboxWidget(),
          const Gap(24),
          CustomButtonWidget(
            text: 'Log in',
            buttonColor: Colors.cyan,
            textColor: Colors.white,
            onPress: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Align(
              child: Text(
                'or',
                style: StyleTypograph.body1.black,
              ),
            ),
          ),
          CustomButtonWidget(
            text: 'Fingerprint',
            buttonColor: Colors.white,
            textColor: Colors.cyan,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
