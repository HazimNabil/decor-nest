import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:decor_nest/core/helper/assets.dart';

class FailureIndicator extends StatelessWidget {
  final String message;

  const FailureIndicator({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: SvgPicture.asset(
            Assets.imagesFailure,
            width: context.screenWidth,
          ),
        ),
        Text(
          message,
          style: AppStyles.semiBold16(context).copyWith(color: Colors.red),
        ),
      ],
    );
  }
}
