import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProductThumbnail extends StatelessWidget {
  final String image;

  const ProductThumbnail({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          width: double.infinity,
          height: context.screenHeight * 0.4,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 12,
          right: 12,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: context.surfaceColor,
            child: IconButton(
              icon: SvgPicture.asset(Assets.iconsFavorite),
              onPressed: () {},
            ),
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
