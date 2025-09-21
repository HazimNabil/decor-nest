import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSubmitted;

  const SearchField({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      leading: SvgPicture.asset(Assets.iconsUnselectedSearch),
      hintText: 'Search Furniture',
      hintStyle: WidgetStatePropertyAll(AppStyles.regular14(context)),
      textStyle: WidgetStatePropertyAll(AppStyles.medium14(context)),
      backgroundColor: WidgetStatePropertyAll(context.surfaceColor),
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16),
      ),
      textInputAction: TextInputAction.search,
      trailing: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => controller.text.isEmpty ? null : controller.clear(),
        ),
      ],
      onSubmitted: onSubmitted,
    );
  }
}
