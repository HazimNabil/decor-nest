import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String) onSubmitted;

  const SearchField({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateState);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: widget.controller,
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
        if (widget.controller.text.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear, size: 20),
            onPressed: () {
              widget.controller.clear();
              widget.onSubmitted('');
            },
          ),
      ],
      onSubmitted: widget.onSubmitted,
    );
  }
}
