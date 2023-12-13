import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ristu_intern_challenge/core/di/injections.dart';
import 'package:ristu_intern_challenge/core/router/routes.dart';
import 'package:ristu_intern_challenge/core/shared/constant/prefs_key.dart';
import 'package:ristu_intern_challenge/core/shared/prefs/shared_preferences.dart';
import 'package:ristu_intern_challenge/core/shared/widgets/custom_button_widget.dart';
import 'package:ristu_intern_challenge/core/shared/widgets/custom_form_widget.dart';
import 'package:ristu_intern_challenge/core/utils/typograph.dart';
import 'package:ristu_intern_challenge/features/auth/data/models/request/login_body.dart';
import 'package:ristu_intern_challenge/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ristu_intern_challenge/features/auth/presentation/widgets/checkbox_widget.dart';

class FormContent extends StatefulWidget {
  const FormContent({super.key});

  @override
  State<FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController nik = TextEditingController();
  TextEditingController password = TextEditingController();
  final authCubit = sl<AuthCubit>();
  final prefs = sl<SharedPrefs>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {}
      },
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('NIK'),
            const Gap(4),
            CustomFormWidget(
              controller: nik,
              obscuredText: false,
              hintText: 'synapsis1010',
            ),
            const Gap(16),
            const Text('Password'),
            const Gap(4),
            CustomFormWidget(
              controller: password,
              obscuredText: true,
              hintText: '*******',
            ),
            const CheckboxWidget(),
            const Gap(24),
            CustomButtonWidget(
              text: 'Log in',
              buttonColor: Colors.cyan,
              textColor: Colors.white,
              onPress: () async {
                if (_formkey.currentState!.validate()) {
                  await authCubit.login(
                    LoginBody(nik: nik.text, password: password.text),
                  );
                  final isGood = prefs.getInt(PrefsKey.saveStatus);
                  final messages = prefs.getString(PrefsKey.saveMessages);

                  debugPrint('check status login $isGood');
                  if (isGood == 200) {
                    Get.snackbar(
                      'Login Success',
                      'Welcome to Home',
                      colorText: Colors.white,
                      backgroundColor: Colors.blue,
                    );
                    await Get.toNamed<void>(Routes.survey);
                  } else {
                    Get.snackbar(
                      'Login Failed',
                      messages,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                  }
                }
              },
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
      ),
    );
  }
}
