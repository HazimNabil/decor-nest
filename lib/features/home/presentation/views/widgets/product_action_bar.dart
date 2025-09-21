import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo_impl.dart';
import 'package:decor_nest/features/home/presentation/view_models/product_cart_cubit/product_cart_cubit.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_cart_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  onPressed: _decreaseQuantity,
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
                  onPressed: () => _increaseQuantity(context),
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
          BlocProvider(
            create: (context) {
              final cubit = ProductCartCubit(locator<CartRepoImpl>());
              return cubit..initCartStatus(widget.product);
            },
            child: ProductCartBlocConsumer(
              product: widget.product,
              totalPrice: _totalPriceNotifier,
              quantity: _quantityNotifier,
            ),
          ),
        ],
      ),
    );
  }

  void _decreaseQuantity() {
    if (_quantityNotifier.value > 1) {
      _quantityNotifier.value--;
      _totalPriceNotifier.value -= widget.product.price;
    }
  }

  void _increaseQuantity(BuildContext context) {
    if (_quantityNotifier.value < widget.product.stock) {
      _quantityNotifier.value++;
      _totalPriceNotifier.value += widget.product.price;
    } else {
      context.showToast(
        message: 'Out of stock',
        type: ToastificationType.info,
      );
    }
  }
}
