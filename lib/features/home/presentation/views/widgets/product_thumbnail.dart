import 'package:cached_network_image/cached_network_image.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:decor_nest/features/home/presentation/view_models/favorite_status_cubit/favorite_status_cubit.dart';
import 'package:decor_nest/core/di/service_locator.dart';

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
          child: BlocProvider(
            create: (context) {
              final cubit = FavoriteStatusCubit(locator<FavoritesRepoImpl>());
              return cubit..initFavoriteStatus(product);
            },
            child: FavoriteButton(product: product),
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
}
