import 'package:cached_network_image/cached_network_image.dart';
import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/home/presentation/view_models/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:toastification/toastification.dart';

class ProductThumbnail extends StatelessWidget {
  final Product product;

  const ProductThumbnail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: product.imageUrl!,
          width: double.infinity,
          height: context.screenHeight * 0.4,
          fit: BoxFit.fill,
          errorWidget: (_, _, _) => const Icon(Icons.error),
        ),
        Positioned(
          top: 12,
          right: 12,
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
                radius: 20,
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
        Positioned(
          top: 12,
          left: 12,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: context.surfaceColor,
            child: IconButton(
              color: context.textColor,
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
          ),
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
