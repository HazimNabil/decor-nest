import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/labeled_field.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddProductForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  const AddProductForm({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fill the details to add a new product',
            style: AppStyles.regular16(context),
          ),
          const SizedBox(height: 24),
          LabeledField(
            label: 'Product Name',
            widget: CustomTextField(
              hint: 'Modern Chair',
              validator: (value) => value.validateRequired('Name'),
            ),
          ),
          const SizedBox(height: 16),
          LabeledField(
            label: 'Description',
            widget: CustomTextField(
              hint: 'Write a short description',
              maxLines: 5,
              validator: (value) => value.validateRequired('Description'),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: LabeledField(
                  label: 'Price',
                  widget: CustomTextField(
                    hint: '120.00',
                    keyboardType: TextInputType.number,
                    validator: (value) => value.validateRequired('Price'),
                  ),
                ),
              ),
              Expanded(
                child: LabeledField(
                  label: 'Stock',
                  widget: CustomTextField(
                    hint: '10',
                    keyboardType: TextInputType.number,
                    validator: (value) => value.validateRequired('Stock'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
