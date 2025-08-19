import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/auth/data/models/login_input_data.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/google_login_bloc_consumer.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/login_bloc_consumer.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/login_form.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/sign_up_option.dart';
import 'package:flutter/material.dart';

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
              const SizedBox(height: 48),
              LoginBlocConsumer(
                formKey: _formKey,
                autovalidateMode: _autovalidateMode,
                loginInputData: _loginInputData,
              ),
              const SizedBox(height: 16),
              const GoogleLoginBlocConsumer(),
              const SizedBox(height: 24),
              const SignUpOption(),
            ],
          ),
        ),
      ),
    );
  }
}
