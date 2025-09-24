import 'package:decor_nest/core/helper/extensions.dart';
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
  final _selectedWoodTypes = <String>[];

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
                color: _selectedWoodTypes.contains(_woodTypes[index])
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
              selected: _selectedWoodTypes.contains(_woodTypes[index]),
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
        _selectedWoodTypes.add(_woodTypes[index]);
      } else {
        _selectedWoodTypes.remove(_woodTypes[index]);
      }
    });
    widget.filter.woodTypes = _selectedWoodTypes;
  }

  List<String> get _woodTypes {
    return const [
      'eucalyptus',
      'teak',
      'oak',
      'pine',
      'maple',
      'bamboo',
      'walnut',
    ];
  }
}
