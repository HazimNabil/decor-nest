import 'package:cached_network_image/cached_network_image.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:decor_nest/features/home/presentation/view_models/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:decor_nest/features/home/presentation/views/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FavoriteCard extends StatelessWidget {
  final FavoriteProduct product;

  const FavoriteCard({super.key, required this.product});

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
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: context.primaryColor,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      Assets.iconsUnselectedFavorites,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () async {
                      await context.read<ToggleFavoriteCubit>().toggleFavorite(
                        favorite: product,
                        isFavorite: false,
                      );
                    },
                  ),
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
}
