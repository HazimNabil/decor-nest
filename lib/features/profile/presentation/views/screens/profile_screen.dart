import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('John Doe', style: AppStyles.medium20(context)),
              const SizedBox(height: 2),
              Text('john.doe@gmail.com', style: AppStyles.regular14(context)),
            ],
          ),
        ),
      ),
    );
  }
}
