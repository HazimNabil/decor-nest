import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/auth/data/models/sign_up_input_data.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/login_option.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;
  late final SignUpInputData _signUpInputData;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
    _signUpInputData = SignUpInputData();
  }

  @override
  void dispose() {
    _autovalidateMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account', style: AppStyles.semiBold32(context)),
              const SizedBox(height: 8),
              Text(
                'Let\'s create account together',
                style: AppStyles.regular16(context),
              ),
              const SizedBox(height: 32),
              ValueListenableBuilder(
                valueListenable: _autovalidateMode,
                builder: (_, value, _) => SignUpForm(
                  formKey: _formKey,
                  autovalidateMode: value,
                  signUpInputData: _signUpInputData,
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Sign Up',
                color: context.primaryColor,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  } else {
                    _autovalidateMode.value = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Sign Up With Google',
                color: context.surfaceColor,
                textColor: context.textColor,
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              const LoginOption(),
            ],
          ),
        ),
      ),
    );
  }
}
