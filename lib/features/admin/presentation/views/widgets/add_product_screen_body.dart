import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/core/widgets/labeled_field.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/add_image_placeholder.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/add_product_form.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';

class AddProductScreenBody extends StatefulWidget {
  const AddProductScreenBody({super.key});

  @override
  State<AddProductScreenBody> createState() => _AddProductScreenBodyState();
}

class _AddProductScreenBodyState extends State<AddProductScreenBody> {
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
  }

  @override
  void dispose() {
    _autovalidateMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
              valueListenable: _autovalidateMode,
              builder: (_, value, _) {
                return AddProductForm(
                  formKey: _formKey,
                  autovalidateMode: value,
                );
              },
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                } else {
                  _autovalidateMode.value = AutovalidateMode.always;
                }
              },
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
