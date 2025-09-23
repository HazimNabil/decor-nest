import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/search_field.dart';
import 'package:decor_nest/features/search/presentation/views/screens/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({super.key});

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: SearchField(
              controller: _searchController,
              onSubmitted: (query) {},
            ),
          ),
        ),
        const SizedBox(width: 4),
        InkWell(
          onTap: () => context.push(FilterScreen.path),
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
      ],
    );
  }
}
