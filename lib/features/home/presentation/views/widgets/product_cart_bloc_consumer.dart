import 'package:decor_nest/features/cart/presentation/views/screens/cart_screen.dart';
import 'package:decor_nest/features/home/presentation/view_models/product_cart_cubit/product_cart_cubit.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class ProductCartBlocConsumer extends StatelessWidget {
  final Product product;
  final double totalPrice;
  final int quantity;

  const ProductCartBlocConsumer({
    super.key,
    required this.product,
    required this.totalPrice,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCartCubit, ProductCartState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          context.showToast(
            message: state.errorMessage!,
            type: ToastificationType.error,
          );
        } else if (state.status.isSuccess) {
          context.showToast(
            message: 'Product added to cart',
            type: ToastificationType.success,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: state.isInCart ? 'See In Cart' : 'Add To Cart',
          icon: Assets.iconsAddToCart,
          color: context.primaryColor,
          isLoading: state.status.isLoading,
          onPressed: () {
            state.isInCart
                ? context.push(CartScreen.path)
                : _addToCart(context);
          },
        );
      },
    );
  }

  Future<void> _addToCart(BuildContext context) async {
    if (context.mounted) {
      await context.read<ProductCartCubit>().addToCart(product, quantity);
    }
  }
}
