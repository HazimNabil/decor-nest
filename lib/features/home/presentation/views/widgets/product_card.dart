import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                Assets.imagesLamp,
                height: 165,
                width: 160,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: context.surfaceColor,
                child: IconButton(
                  icon: SvgPicture.asset(Assets.iconsFavorite),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text('Product Name', style: AppStyles.medium16(context)),
        const SizedBox(height: 4),
        Text(
          r'$100',
          style: AppStyles.medium16(
            context,
          ).copyWith(color: context.actionColor),
        ),
      ],
    );
  }
}
