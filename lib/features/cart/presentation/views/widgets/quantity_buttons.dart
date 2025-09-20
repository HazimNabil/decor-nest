import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class QuantityButtons extends StatelessWidget {
  const QuantityButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        SizedBox(
          width: 26,
          height: 26,
          child: IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {},
            iconSize: 20,
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              backgroundColor: context.backgroundColor,
              foregroundColor: context.subTextColor,
            ),
          ),
        ),
        Text(
          '1',
          style: AppStyles.regular14(
            context,
          ).copyWith(color: context.textColor),
        ),
        SizedBox(
          width: 26,
          height: 26,
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            iconSize: 20,
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              backgroundColor: context.primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
