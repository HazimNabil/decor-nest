import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'read_products_event.dart';
part 'read_products_state.dart';

class ReadProductsBloc extends Bloc<ReadProductsEvent, ReadProductsState> {
  final AdminRepo _adminRepo;

  ReadProductsBloc(this._adminRepo) : super(const ReadProductsState()) {
    on<ProductsFetched>(_readProducts, transformer: droppable());
  }

  Future<void> _readProducts(
    ProductsFetched event,
    Emitter<ReadProductsState> emit,
  ) async {
    if (state.hasReachedMax) return;

    if (state.page == 0) {
      emit(state.copyWith(status: ReadProductsStatus.loading));
    }

    final result = await _adminRepo.readProducts(page: state.page);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ReadProductsStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (products) {
        final oldProducts = state.products;
        emit(
          state.copyWith(
            status: ReadProductsStatus.success,
            products: oldProducts + products,
            hasReachedMax: products.length < 10,
            page: state.page + 1,
          ),
        );
      },
    );
  }
}
