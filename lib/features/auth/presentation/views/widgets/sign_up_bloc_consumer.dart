import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/features/auth/data/models/sign_up_input_data.dart';
import 'package:decor_nest/features/auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class SignUpBlocConsumer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autovalidateMode;
  final SignUpInputData signUpInputData;

  const SignUpBlocConsumer({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.signUpInputData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          context.showToast(
            message: 'Sign Up Success, Check your email for verification',
            type: ToastificationType.success,
          );
          context.pop();
        } else if (state is SignUpFailure) {
          context.showToast(
            message: state.message,
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Sign Up',
          color: context.primaryColor,
          isLoading: state is SignUpLoading,
          onPressed: () async => await _signUp(context),
        );
      },
    );
  }

  Future<void> _signUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await context.read<SignUpCubit>().signUp(signUpInputData);
    } else {
      autovalidateMode.value = AutovalidateMode.always;
    }
  }
}
