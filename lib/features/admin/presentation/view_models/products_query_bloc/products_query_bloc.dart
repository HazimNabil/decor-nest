import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_query_event.dart';
part 'products_query_state.dart';

class ProductsQueryBloc extends Bloc<ProductsQueryEvent, ProductsQueryState> {
  final AdminRepo _adminRepo;

  ProductsQueryBloc(this._adminRepo) : super(const ProductsQueryState()) {
    on<ProductsFetched>(_readProducts, transformer: droppable());
    on<ProductsRefreshed>(_refreshProducts, transformer: droppable());
  }

  Future<void> _readProducts(
    ProductsFetched event,
    Emitter<ProductsQueryState> emit,
  ) async {
    if (state.hasReachedMax || state.status.isFailure) return;

    if (state.page == 0) {
      emit(state.copyWith(status: ProductsQueryStatus.loading));
    }

    final result = await _adminRepo.readProducts(page: state.page);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductsQueryStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (products) {
        final oldProducts = state.products;
        emit(
          state.copyWith(
            status: ProductsQueryStatus.success,
            products: oldProducts + products,
            hasReachedMax: products.length < 10,
            page: state.page + 1,
          ),
        );
      },
    );
  }

  void _refreshProducts(
    ProductsRefreshed event,
    Emitter<ProductsQueryState> emit,
  ) {
    emit(const ProductsQueryState());
    add(const ProductsFetched());
  }
}
