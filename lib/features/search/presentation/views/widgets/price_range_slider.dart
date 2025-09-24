import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _values = const RangeValues(0, 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Price Range', style: AppStyles.medium20(context)),
        const SizedBox(height: 16),
        SliderTheme(
          data: const SliderThemeData(
            trackHeight: 8,
            rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 11),
          ),
          child: RangeSlider(
            values: _values,
            max: 1000,
            activeColor: context.primaryColor,
            inactiveColor: context.subTextColor.withAlpha(128),
            divisions: 100,
            labels: RangeLabels(
              _values.start.round().toString(),
              _values.end.round().toString(),
            ),
            onChanged: (values) => setState(() => _values = values),
          ),
        ),
      ],
    );
  }
}
