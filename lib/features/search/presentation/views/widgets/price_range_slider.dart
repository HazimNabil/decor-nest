import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  final ProductFilter filter;

  const PriceRangeSlider({super.key, required this.filter});

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
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
            values: RangeValues(widget.filter.minPrice, widget.filter.maxPrice),
            max: 1000,
            activeColor: context.primaryColor,
            inactiveColor: context.subTextColor.withAlpha(128),
            divisions: 100,
            labels: RangeLabels(
              widget.filter.minPrice.round().toString(),
              widget.filter.maxPrice.round().toString(),
            ),
            onChanged: _selectPriceRange,
          ),
        ),
      ],
    );
  }

  void _selectPriceRange(values) {
    setState(() {
      widget.filter.minPrice = values.start;
      widget.filter.maxPrice = values.end;
    });
  }
}
