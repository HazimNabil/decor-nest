import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/auth/data/models/login_input_data.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/login_form.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/forgot_password_option.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/sign_up_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;
  late final LoginInputData _loginInputData;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
    _loginInputData = LoginInputData();
  }

  @override
  void dispose() {
    _autovalidateMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome Back', style: AppStyles.semiBold32(context)),
              const SizedBox(height: 8),
              Text(
                'Welcome Back! Please Enter Your Details.',
                style: AppStyles.regular16(context),
              ),
              const SizedBox(height: 48),
              ValueListenableBuilder(
                valueListenable: _autovalidateMode,
                builder: (_, value, _) => LoginForm(
                  formKey: _formKey,
                  autovalidateMode: value,
                  loginInputData: _loginInputData,
                ),
              ),
              const SizedBox(height: 16),
              const ForgotPasswordOption(),
              const SizedBox(height: 48),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    context.showToast(
                      message: 'Login Success',
                      type: ToastificationType.success,
                    );
                    context.go('/home');
                  } else if (state is LoginFailure) {
                    context.showToast(
                      message: state.message,
                      type: ToastificationType.error,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: 'Sign In',
                    color: context.primaryColor,
                    isLoading: state is LoginLoading,
                    onPressed: () async => await _logIn(),
                  );
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Sign In With Google',
                icon: Assets.iconsGoogle,
                color: context.surfaceColor,
                textColor: context.textColor,
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              const SignUpOption(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _logIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await context.read<LoginCubit>().logIn(_loginInputData);
    } else {
      _autovalidateMode.value = AutovalidateMode.always;
    }
  }
}
