import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:decor_nest/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepo _searchRepo;

  SearchBloc(this._searchRepo) : super(const SearchState()) {
    on<ProductsSearched>(_searchProducts, transformer: droppable());
    on<ProductsMoreSearched>(_searchMoreProducts, transformer: droppable());
  }

  FutureOr<void> _searchProducts(
    ProductsSearched event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchState());
    await _handlePagination(
      event: event,
      emit: emit,
      request: () async {
        return await _searchRepo.searchProducts(
          filter: event.filter,
          page: state.page,
        );
      },
    );
  }

  FutureOr<void> _searchMoreProducts(
    ProductsMoreSearched event,
    Emitter<SearchState> emit,
  ) async {
    await _handlePagination(
      event: event,
      emit: emit,
      request: () async {
        return await _searchRepo.searchProducts(
          filter: state.filter,
          page: state.page,
        );
      },
    );
  }

  Future<void> _handlePagination({
    required SearchEvent event,
    required Emitter<SearchState> emit,
    required FutureEither<List<Product>> Function() request,
  }) async {
    if (state.hasReachedMax || state.status.isFailure) return;

    if (state.page == 0) {
      emit(state.copyWith(status: SearchStatus.loading));
    }

    final result = await request();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SearchStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (products) {
        final oldProducts = state.products;
        emit(
          state.copyWith(
            status: SearchStatus.success,
            products: [...oldProducts, ...products],
            hasReachedMax: products.length < 10,
            page: state.page + 1,
            filter: event is ProductsSearched ? event.filter : state.filter,
          ),
        );
      },
    );
  }
}
