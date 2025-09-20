import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';

class QuantityButtons extends StatelessWidget {
  final CartProduct cartProduct;

  const QuantityButtons({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        SizedBox(
          width: 22,
          height: 22,
          child: IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              if (cartProduct.quantity == 1) {
                context.read<CartCubit>().removeFromCart(cartProduct);
              }
            },
            iconSize: 18,
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              backgroundColor: context.backgroundColor,
              foregroundColor: context.subTextColor,
            ),
          ),
        ),
        Text(
          '${cartProduct.quantity}',
          style: AppStyles.regular14(
            context,
          ).copyWith(color: context.textColor),
        ),
        SizedBox(
          width: 22,
          height: 22,
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            iconSize: 18,
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              backgroundColor: context.primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
