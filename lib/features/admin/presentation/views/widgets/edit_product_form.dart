import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:decor_nest/core/widgets/labeled_field.dart';
import 'package:flutter/material.dart';

class EditProductForm extends StatelessWidget {
  final Product product;
  final GlobalKey<FormState> formKey;

  const EditProductForm({super.key, required this.product, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
