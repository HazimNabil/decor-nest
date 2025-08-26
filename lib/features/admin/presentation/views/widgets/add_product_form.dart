import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/labeled_field.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:decor_nest/features/admin/data/models/product_input_data.dart';

class AddProductForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final ProductInputData productInputData;

  const AddProductForm({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.productInputData,
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
              onSaved: (value) => productInputData.name = value,
            ),
          ),
          const SizedBox(height: 16),
          LabeledField(
            label: 'Description',
            widget: CustomTextField(
              hint: 'Write a short description',
              maxLines: 5,
              validator: (value) => value.validateRequired('Description'),
              onSaved: (value) => productInputData.description = value,
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
                    onSaved: (value) =>
                        productInputData.price = double.parse(value!),
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
                    onSaved: (value) =>
                        productInputData.stock = int.parse(value!),
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
