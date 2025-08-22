import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/core/widgets/labeled_field.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/add_image_placeholder.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';

class AddProductScreenBody extends StatelessWidget {
  const AddProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fill the details to add a new product',
              style: AppStyles.regular16(context),
            ),
            const SizedBox(height: 24),
            const LabeledField(
              label: 'Product Name',
              widget: CustomTextField(hint: 'Modern Chair'),
            ),
            const SizedBox(height: 16),
            const LabeledField(
              label: 'Description',
              widget: CustomTextField(
                hint: 'Write a short description',
                maxLines: 5,
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              spacing: 12,
              children: [
                Expanded(
                  child: LabeledField(
                    label: 'Price',
                    widget: CustomTextField(
                      hint: '120.00',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: LabeledField(
                    label: 'Stock',
                    widget: CustomTextField(
                      hint: '10',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: LabeledField(
                    label: 'Category',
                    widget: CustomDropDownButton(
                      hint: 'Select category',
                      values: _categories,
                    ),
                  ),
                ),
                Expanded(
                  child: LabeledField(
                    label: 'Wood Type',
                    widget: CustomDropDownButton(
                      hint: 'Select wood type',
                      values: _woodTypes,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const AddImagePlaceholder(),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Add Product',
              color: context.primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  List<String> get _categories {
    return const ['chair', 'table', 'lamp', 'sofa', 'mirror', 'mattress'];
  }

  List<String> get _woodTypes {
    return const [
      'eucalyptus',
      'teak',
      'oak',
      'pine',
      'maple',
      'bamboo',
      'walnut',
    ];
  }
}
