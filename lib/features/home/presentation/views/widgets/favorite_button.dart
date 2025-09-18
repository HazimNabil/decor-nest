import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/home/presentation/view_models/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toastification/toastification.dart';

class FavoriteButton extends StatelessWidget {
  final Product product;

  const FavoriteButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToggleFavoriteCubit, ToggleFavoriteState>(
      buildWhen: (_, current) => current is ToggleFavoriteSuccess,
      listenWhen: (_, current) => current is ToggleFavoriteFailure,
      listener: (context, state) {
        if (state is ToggleFavoriteFailure) {
          context.showToast(
            message: state.message,
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        final isFavorite = state is ToggleFavoriteSuccess
            ? state.isFavorite
            : false;

        return CircleAvatar(
          radius: 20,
          backgroundColor: isFavorite
              ? context.primaryColor
              : context.surfaceColor,
          child: state is ToggleFavoriteLoading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(context.primaryColor),
                  strokeWidth: 3,
                  padding: const EdgeInsets.all(10),
                )
              : IconButton(
                  icon: SvgPicture.asset(
                    Assets.iconsUnselectedFavorites,
                    colorFilter: ColorFilter.mode(
                      isFavorite ? Colors.white : context.subTextColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () async => await toggleFavorite(context),
                ),
        );
      },
    );
  }

  Future<void> toggleFavorite(BuildContext context) async {
    if (context.mounted) {
      await context.read<ToggleFavoriteCubit>().toggleFavorite(product);
    }
  }
}
