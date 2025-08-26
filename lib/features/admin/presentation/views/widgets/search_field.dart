import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:decor_nest/features/admin/presentation/view_models/products_query_bloc/products_query_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: SvgPicture.asset(Assets.iconsSearch),
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
      onSubmitted: (query) {
        if (query.isNotEmpty) {
          context.read<ProductsQueryBloc>().add(ProductsSearched(query.trim()));
        }
      },
    );
  }
}
