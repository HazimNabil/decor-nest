import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/services/reference_data_service.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:flutter/material.dart';

class WoodTypeFilterChips extends StatefulWidget {
  final ProductFilter filter;

  const WoodTypeFilterChips({super.key, required this.filter});

  @override
  State<WoodTypeFilterChips> createState() => _WoodTypeFilterChipsState();
}

class _WoodTypeFilterChipsState extends State<WoodTypeFilterChips> {
  final _woodTypes = locator<ReferenceDataService>().woodTypes;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Wood Type', style: AppStyles.medium20(context)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 4,
          children: List.generate(_woodTypes.length, (index) {
            return FilterChip(
              label: Text(_woodTypes[index]),
              labelStyle: AppStyles.regular14(context).copyWith(
                color: widget.filter.woodTypes.contains(_woodTypes[index])
                    ? Colors.white
                    : context.subTextColor,
              ),
              selectedColor: context.primaryColor,
              checkmarkColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              selected: widget.filter.woodTypes.contains(_woodTypes[index]),
              onSelected: (selected) => _selectWoodTypes(selected, index),
            );
          }),
        ),
      ],
    );
  }

  void _selectWoodTypes(bool selected, int index) {
    setState(() {
      if (selected) {
        widget.filter.woodTypes.add(_woodTypes[index]);
      } else {
        widget.filter.woodTypes.remove(_woodTypes[index]);
      }
    });
  }
}
