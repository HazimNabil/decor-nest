import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/core/widgets/labeled_field.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/edit_product_form.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/update_image_placeholder.dart';
import 'package:flutter/material.dart';

class EditProductScreenBody extends StatelessWidget {
  final Product product;
  final _formKey = GlobalKey<FormState>();

  EditProductScreenBody({super.key, required this.product});

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
            EditProductForm(product: product, formKey: _formKey),
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
