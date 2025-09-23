import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
