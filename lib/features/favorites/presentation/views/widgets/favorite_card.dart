import 'package:cached_network_image/cached_network_image.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:decor_nest/features/favorites/presentation/view_models/favorites_cubit/favorites_cubit.dart';
import 'package:decor_nest/features/home/presentation/views/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoriteCard extends StatelessWidget {
  final FavoriteProduct favorite;

  const FavoriteCard({super.key, required this.favorite});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () =>
              context.push(DetailsScreen.path, extra: favorite.toProduct()),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  imageUrl: favorite.imageUrl!,
                  errorWidget: (_, _, _) => const Icon(Icons.error),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Skeleton.shade(
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
                      onPressed: () async => await removeFromFavorite(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          favorite.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.medium16(context),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${favorite.price.toStringAsFixed(2)}',
          style: AppStyles.medium16(
            context,
          ).copyWith(color: context.actionColor),
        ),
      ],
    );
  }

  Future<void> removeFromFavorite(BuildContext context) async {
    await context.read<FavoritesCubit>().removeFromFavorite(favorite);
  }
}
