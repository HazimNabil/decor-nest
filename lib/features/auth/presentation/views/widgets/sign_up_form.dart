import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:decor_nest/core/widgets/labeled_field.dart';
import 'package:decor_nest/features/auth/data/models/sign_up_input_data.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final SignUpInputData signUpInputData;

  const SignUpForm({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.signUpInputData,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabeledField(
            label: 'Name',
            widget: CustomTextField(
              hint: 'Enter your name',
              validator: (input) => input.validateRequired('name'),
              onSaved: (username) => signUpInputData.username = username!,
            ),
          ),
          const SizedBox(height: 16),
          LabeledField(
            label: 'Email',
            widget: CustomTextField(
              hint: 'Enter your email',
              validator: (input) => input.validateEmail(),
              onSaved: (email) => signUpInputData.email = email!,
            ),
          ),
          const SizedBox(height: 16),
          LabeledField(
            label: 'Password',
            widget: CustomTextField(
              hint: 'Enter your password',
              isPassword: true,
              validator: (input) => input.validatePassword(),
              onChanged: (password) => signUpInputData.password = password,
            ),
          ),
          const SizedBox(height: 16),
          LabeledField(
            label: 'Confirm Password',
            widget: CustomTextField(
              hint: 'Confirm your password',
              isPassword: true,
              validator: (input) =>
                  input.validateConfirmPassword(signUpInputData.password),
            ),
          ),
        ],
      ),
    );
  }
}
