import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditProductScreenBody extends StatelessWidget {
  const EditProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update the fields you want to modify',
              style: AppStyles.regular16(context),
            ),
            const SizedBox(height: 24),
            Text('Product Name', style: AppStyles.medium14(context)),
            const SizedBox(height: 8),
            const CustomTextField(hint: 'Modern Chair'),
            const SizedBox(height: 16),
            Text('Description', style: AppStyles.medium14(context)),
            const SizedBox(height: 8),
            const CustomTextField(
              hint: 'Write a short description',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
