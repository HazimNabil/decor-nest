import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/core/widgets/labeled_field.dart';
import 'package:decor_nest/features/admin/data/models/product_input_data.dart';
import 'package:decor_nest/features/admin/presentation/view_models/edit_product_cubit/edit_product_cubit.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/edit_product_form.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/update_image_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class EditProductScreenBody extends StatelessWidget {
  final Product product;
  final _productInputData = ProductInputData();
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
            EditProductForm(
              product: product,
              formKey: _formKey,
              productInputData: _productInputData,
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
                      onChanged: (category) =>
                          _productInputData.category = category,
                    ),
                  ),
                ),
                Expanded(
                  child: LabeledField(
                    label: 'Wood Type',
                    widget: CustomDropDownButton(
                      currentValue: product.woodType,
                      values: _woodTypes,
                      onChanged: (woodType) =>
                          _productInputData.woodType = woodType,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            UpdateImagePlaceholder(
              imageUrl: product.imageUrl,
              productInputData: _productInputData,
            ),
            const SizedBox(height: 24),
            BlocConsumer<EditProductCubit, EditProductState>(
              listener: (context, state) {
                if (state is EditProductSuccess) {
                  context.showToast(
                    message: 'Product edited successfully',
                    type: ToastificationType.success,
                  );
                  context.pop();
                } else if (state is EditProductFailure) {
                  context.showToast(
                    message: state.message,
                    type: ToastificationType.error,
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  text: 'Update Product',
                  color: context.primaryColor,
                  isLoading: state is EditProductLoading,
                  onPressed: () async => await editProduct(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> editProduct(BuildContext context) async {
    _formKey.currentState!.save();
    await context.read<EditProductCubit>().editProduct(
      fields: _productInputData,
      product: product,
      image: _productInputData.image,
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
