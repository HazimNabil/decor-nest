import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/home/presentation/view_models/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:toastification/toastification.dart';

class AddToCartBlocConsumer extends StatelessWidget {
  final Product product;
  final double totalPrice;
  final int quantity;

  const AddToCartBlocConsumer({
    super.key,
    required this.product,
    required this.totalPrice,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartFailure) {
          context.showToast(
            message: state.message,
            type: ToastificationType.error,
          );
        } else if (state is AddToCartSuccess) {
          context.showToast(
            message: 'Product added to cart',
            type: ToastificationType.success,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Add To Cart',
          icon: Assets.iconsAddToCart,
          color: context.primaryColor,
          isLoading: state is AddToCartLoading,
          onPressed: () => _addToCart(context),
        );
      },
    );
  }

  Future<void> _addToCart(BuildContext context) async {
    final userId = await CacheHelper.getSecureData(CacheConstants.userId);

    final cartProduct = CartProduct(
      name: product.name,
      imageUrl: product.imageUrl,
      price: totalPrice,
      stock: product.stock,
      quantity: quantity,
      productId: product.id!,
      totalPrice: totalPrice,
      userId: userId,
      description: product.description,
      category: product.category,
      woodType: product.woodType,
      imagePath: product.imagePath,
    );

    if (context.mounted) {
      await context.read<AddToCartCubit>().addToCart(cartProduct);
    }
  }
}
