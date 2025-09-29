import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Logout',
        style: AppStyles.medium20(context).copyWith(color: Colors.red),
      ),
    );
  }
}
