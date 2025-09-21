import 'package:decor_nest/features/search/presentation/views/widgets/search_header.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [SliverToBoxAdapter(child: SearchHeader())],
          ),
        ),
      ),
    );
  }
}
