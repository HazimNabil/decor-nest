import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/search_field.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:decor_nest/features/search/presentation/view_models/search_bloc/search_bloc.dart';
import 'package:decor_nest/features/search/presentation/views/screens/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({super.key});

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  late final TextEditingController _searchController;
  late final ProductFilter _filter;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filter = ProductFilter(categories: [], woodTypes: []);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: SearchField(
              controller: _searchController,
              onSubmitted: (query) {
                _filter.searchQuery = query;
                context.read<SearchBloc>().add(ProductsSearched(_filter));
              },
            ),
          ),
        ),
        InkWell(
          onTap: () => context.push(FilterScreen.path, extra: _filter),
          child: Badge.count(
            count: _filter.filterCount,
            isLabelVisible: _filter.filterCount > 0,
            backgroundColor: context.actionColor,
            textColor: Colors.white,
            textStyle: AppStyles.medium14(context),
            padding: const EdgeInsets.all(3),
            largeSize: 24,
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: context.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(
                Assets.iconsFilter,
                fit: BoxFit.scaleDown,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
