import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:decor_nest/core/widgets/labeled_field.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/update_image_placeholder.dart';
import 'package:flutter/material.dart';

class EditProductScreenBody extends StatelessWidget {
  final Product product;

  const EditProductScreenBody({super.key, required this.product});

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
            LabeledField(
              label: 'Product Name',
              widget: CustomTextField(hint: product.name),
            ),
            const SizedBox(height: 16),
            LabeledField(
              label: 'Description',
              widget: CustomTextField(hint: product.description, maxLines: 5),
            ),
            const SizedBox(height: 16),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: LabeledField(
                    label: 'Price',
                    widget: CustomTextField(
                      hint: product.price.toStringAsFixed(2),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: LabeledField(
                    label: 'Stock',
                    widget: CustomTextField(
                      hint: product.stock.toString(),
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
                      currentValue: product.category,
                      values: _categories,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Expanded(
                  child: LabeledField(
                    label: 'Wood Type',
                    widget: CustomDropDownButton(
                      currentValue: product.woodType,
                      values: _woodTypes,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            UpdateImagePlaceholder(imageUrl: product.imageUrl),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Update Product',
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
