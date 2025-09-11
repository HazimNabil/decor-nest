import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/presentation/views/screens/cart_screen.dart';
import 'package:decor_nest/features/home/presentation/view_models/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class ProductActionBar extends StatefulWidget {
  final Product product;

  const ProductActionBar({super.key, required this.product});

  @override
  State<ProductActionBar> createState() => _ProductActionBarState();
}

class _ProductActionBarState extends State<ProductActionBar> {
  late final ValueNotifier<int> _quantityNotifier;
  late final ValueNotifier<double> _totalPriceNotifier;

  @override
  void initState() {
    super.initState();
    _quantityNotifier = ValueNotifier(1);
    _totalPriceNotifier = ValueNotifier(widget.product.price);
  }

  @override
  void dispose() {
    _quantityNotifier.dispose();
    _totalPriceNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: 8,
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: context.backgroundColor,
                foregroundColor: context.subTextColor,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (_quantityNotifier.value > 1) {
                      _quantityNotifier.value--;
                      _totalPriceNotifier.value -= widget.product.price;
                    }
                  },
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _quantityNotifier,
                builder: (context, value, _) {
                  return Text(
                    value.toString(),
                    style: AppStyles.regular14(
                      context,
                    ).copyWith(color: context.textColor),
                  );
                },
              ),
              CircleAvatar(
                radius: 13,
                backgroundColor: context.primaryColor,
                foregroundColor: Colors.white,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_quantityNotifier.value < widget.product.stock) {
                      _quantityNotifier.value++;
                      _totalPriceNotifier.value += widget.product.price;
                    } else {
                      context.showToast(
                        message: 'Stock is not available',
                        type: ToastificationType.error,
                      );
                    }
                  },
                ),
              ),
              const Spacer(),
              ValueListenableBuilder(
                valueListenable: _totalPriceNotifier,
                builder: (context, value, _) {
                  return Text(
                    'Total: \$${value.toStringAsFixed(2)}',
                    style: AppStyles.medium16(context),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          BlocConsumer<AddToCartCubit, AddToCartState>(
            listener: (context, state) {
              if (state is AddToCartFailure) {
                context.showToast(
                  message: state.message,
                  type: ToastificationType.error,
                );
              } else if (state is AddToCartSuccess) {
                widget.product.isInCart = true;
                context.showToast(
                  message: 'Product added to cart',
                  type: ToastificationType.success,
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                text: widget.product.isInCart ? 'See In Cart' : 'Add To Cart',
                icon: Assets.iconsAddToCart,
                color: context.primaryColor,
                isLoading: state is AddToCartLoading,
                onPressed: () => widget.product.isInCart
                    ? context.push(CartScreen.path)
                    : _addToCart(context),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _addToCart(BuildContext context) async {
    final userId = await CacheHelper.getSecureData(CacheConstants.userId);

    final cartProduct = CartProduct(
      name: widget.product.name,
      imageUrl: widget.product.imageUrl,
      price: _totalPriceNotifier.value,
      stock: widget.product.stock,
      quantity: _quantityNotifier.value,
      productId: widget.product.id!,
      userId: userId,
    );

    if (context.mounted) {
      await context.read<AddToCartCubit>().addToCart(cartProduct);
    }
  }
}
