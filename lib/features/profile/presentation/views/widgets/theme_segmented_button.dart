import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class ThemeSegmentedButton extends StatelessWidget {
  const ThemeSegmentedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SegmentedButton(
        segments: const [
          ButtonSegment(value: ThemeMode.system, label: Text('System')),
          ButtonSegment(value: ThemeMode.light, label: Text('Light')),
          ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
        ],
        selected: const {ThemeMode.system},
        onSelectionChanged: (selected) {},
        showSelectedIcon: false,
        style: SegmentedButton.styleFrom(
          backgroundColor: context.surfaceColor,
          selectedBackgroundColor: context.primaryColor,
          foregroundColor: context.textColor,
          selectedForegroundColor: Colors.white,
          textStyle: AppStyles.medium16(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: BorderSide(width: 0.1, color: context.textColor),
        ),
      ),
    );
  }
}
