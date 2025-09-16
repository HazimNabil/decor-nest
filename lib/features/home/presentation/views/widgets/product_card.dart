import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:decor_nest/features/home/presentation/view_models/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:decor_nest/features/home/presentation/views/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:toastification/toastification.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => context.push(
            DetailsScreen.path,
            extra: (product, context.read<ToggleFavoriteCubit>()),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl!,
                  errorWidget: (_, _, _) => const Icon(Icons.error),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: BlocConsumer<ToggleFavoriteCubit, ToggleFavoriteState>(
                  listener: (context, state) {
                    if (state is ToggleFavoriteFailure) {
                      context.showToast(
                        message: state.message,
                        type: ToastificationType.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    return CircleAvatar(
                      radius: 15,
                      backgroundColor: context.surfaceColor,
                      child: IconButton(
                        icon: SvgPicture.asset(
                          Assets.iconsUnselectedFavorites,
                          colorFilter: ColorFilter.mode(
                            context.subTextColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () async => await toggleFavorite(context),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.medium16(context),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: AppStyles.medium16(
            context,
          ).copyWith(color: context.actionColor),
        ),
      ],
    );
  }

  Future<void> toggleFavorite(BuildContext context) async {
    final userId = await CacheHelper.getSecureData(CacheConstants.userId);
    final favorite = FavoriteProduct.fromProduct(product, userId);

    if (context.mounted) {
      await context.read<ToggleFavoriteCubit>().toggleFavorite(
        favorite: favorite,
        isFavorite: true,
      );
    }
  }
}
