import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:flutter/material.dart';

class SortByDropDown extends StatefulWidget {
  final ProductFilter filter;

  const SortByDropDown({super.key, required this.filter});

  @override
  State<SortByDropDown> createState() => _SortByDropDownState();
}

class _SortByDropDownState extends State<SortByDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<SortBy>(
        value: widget.filter.sortBy,
        elevation: 0,
        isExpanded: true,
        borderRadius: BorderRadius.circular(12),
        underline: const SizedBox.shrink(),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        menuMaxHeight: 200,
        style: AppStyles.medium16(context),
        items: _sortByOptions.entries.map((option) {
          return DropdownMenuItem(value: option.value, child: Text(option.key));
        }).toList(),
        onChanged: _selectSortByOption,
      ),
    );
  }

  void _selectSortByOption(SortBy? option) {
    setState(() {
      widget.filter.sortBy = option!;
    });
  }

  Map<String, SortBy> get _sortByOptions {
    return const {
      'Newest': (column: TableConstants.createdAt, ascending: false),
      'Oldest': (column: TableConstants.createdAt, ascending: true),
      'Price: Low to High': (column: TableConstants.price, ascending: true),
      'Price: High to Low': (column: TableConstants.price, ascending: false),
    };
  }
}
