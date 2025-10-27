import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/admin/data/models/product_input_data.dart';
import 'package:decor_nest/features/admin/presentation/view_models/add_product_cubit/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class AddProductBlocConsumer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autovalidateMode;
  final ProductInputData productInputData;

  const AddProductBlocConsumer({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.productInputData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          context.showToast(
            message: 'Product added successfully',
            type: ToastificationType.success,
          );
          context.pop();
        } else if (state is AddProductFailure) {
          context.showToast(
            message: state.message,
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Add Product',
          color: context.primaryColor,
          isLoading: state is AddProductLoading,
          onPressed: () async => await _addProduct(context),
        );
      },
    );
  }

  Future<void> _addProduct(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await context.read<AddProductCubit>().addProduct(
        Product.fromInputData(productInputData),
        productInputData.image!,
      );
    } else {
      autovalidateMode.value = AutovalidateMode.always;
    }
  }
}
