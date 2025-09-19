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
      listenWhen: (_, current) => current.status.isFailure,
      listener: (_, state) {
        context.showToast(
          message: state.errorMessage!,
          type: ToastificationType.error,
        );
      },
      builder: (context, state) {
        if (state.status.isLoading) {
          return CircleAvatar(
            radius: 20,
            backgroundColor: context.surfaceColor,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(context.primaryColor),
              padding: const EdgeInsets.all(10),
            ),
          );
        }
        return CircleAvatar(
          radius: 20,
          backgroundColor: state.isFavorite
              ? context.primaryColor
              : context.surfaceColor,
          child: IconButton(
            icon: SvgPicture.asset(
              Assets.iconsUnselectedFavorites,
              colorFilter: ColorFilter.mode(
                state.isFavorite ? Colors.white : context.subTextColor,
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
