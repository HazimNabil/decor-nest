import 'package:bloc_concurrency/bloc_concurrency.dart' show droppable;
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_products_event.dart';
part 'fetch_products_state.dart';

class FetchProductsBloc extends Bloc<FetchProductsEvent, FetchProductsState> {
  final HomeRepo _homeRepo;

  FetchProductsBloc(this._homeRepo) : super(const FetchProductsState()) {
    on<ProductsFetched>(_fetchProducts);
    on<ProductsMoreFetched>(_fetchMoreProducts, transformer: droppable());
  }

  Future<void> _fetchProducts(
    ProductsFetched event,
    Emitter<FetchProductsState> emit,
  ) async {
    emit(const FetchProductsState());
    await _handlePagination(
      event: event,
      emit: emit,
      request: () async {
        return await _homeRepo.fetchProducts(
          page: state.page,
          category: event.category,
        );
      },
    );
  }

  Future<void> _fetchMoreProducts(
    ProductsMoreFetched event,
    Emitter<FetchProductsState> emit,
  ) async {
    await _handlePagination(
      event: event,
      emit: emit,
      request: () async {
        return await _homeRepo.fetchProducts(
          page: state.page,
          category: state.category,
        );
      },
    );
  }

  Future<void> _handlePagination({
    required FetchProductsEvent event,
    required Emitter<FetchProductsState> emit,
    required FutureEither<List<Product>> Function() request,
  }) async {
    if (state.hasReachedMax || state.status.isFailure) return;

    if (state.page == 0) {
      emit(state.copyWith(status: FetchProductsStatus.loading));
    }

    final result = await request();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FetchProductsStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (products) {
        final oldProducts = state.products;
        emit(
          state.copyWith(
            status: FetchProductsStatus.success,
            products: oldProducts + products,
            category: event is ProductsFetched
                ? event.category
                : state.category,
            hasReachedMax: products.length < 10,
            page: state.page + 1,
          ),
        );
      },
    );
  }
}
