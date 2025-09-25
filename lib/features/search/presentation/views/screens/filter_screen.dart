import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:decor_nest/features/search/presentation/view_models/search_bloc/search_bloc.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/category_filter_chips.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/price_range_slider.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/sort_by_drop_down.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/wood_type_filter_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FilterScreen extends StatefulWidget {
  static const path = '/filter';
  final ProductFilter filter;

  const FilterScreen({super.key, required this.filter});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Filter'),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: SingleChildScrollView(
          child: Column(
            spacing: 28,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryFilterChips(filter: widget.filter),
              WoodTypeFilterChips(filter: widget.filter),
              PriceRangeSlider(filter: widget.filter),
              SortByDropDown(filter: widget.filter),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: context.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    setState(() => widget.filter.clear());
                    context.read<SearchBloc>().add(
                      ProductsSearched(widget.filter),
                    );
                    context.pop();
                  },
                  child: Text(
                    'Clear Filters',
                    style: AppStyles.semiBold16(
                      context,
                    ).copyWith(color: context.primaryColor),
                  ),
                ),
              ),
              CustomButton(
                text: 'Apply Filters',
                color: context.primaryColor,
                onPressed: () {
                  context.read<SearchBloc>().add(
                    ProductsSearched(widget.filter),
                  );
                  context.pop();
                },
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
