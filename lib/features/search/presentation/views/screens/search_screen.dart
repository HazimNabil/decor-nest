import 'package:decor_nest/features/search/presentation/views/widgets/search_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/search/presentation/view_models/search_bloc/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final currentPosition = _scrollController.position.pixels;
    final maxPosition = _scrollController.position.maxScrollExtent;
    if (currentPosition >= maxPosition * 0.7) {
      context.read<SearchBloc>().add(const ProductsMoreSearched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchScreenBody(scrollController: _scrollController),
      ),
    );
  }
}
