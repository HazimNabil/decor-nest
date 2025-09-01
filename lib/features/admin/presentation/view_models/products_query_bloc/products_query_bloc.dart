import 'dart:developer' show log;

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_query_event.dart';
part 'products_query_state.dart';

class ProductsQueryBloc extends Bloc<ProductsQueryEvent, ProductsQueryState> {
  final AdminRepo _adminRepo;

  ProductsQueryBloc(this._adminRepo) : super(const ProductsQueryState()) {
    on<ProductsFetched>(_readProducts);
    on<ProductsRefreshed>(_refreshProducts, transformer: droppable());
    on<ProductsSearched>(_searchProducts, transformer: droppable());
    on<ProductsMoreFetched>(_fetchMoreProducts, transformer: droppable());
  }

  Future<void> _readProducts(
    ProductsFetched event,
    Emitter<ProductsQueryState> emit,
  ) async {
    emit(const ProductsQueryState());
    await _handlePagination(
      event: event,
      emit: emit,
      request: () async => await _adminRepo.readProducts(page: state.page),
    );
  }

  Future<void> _searchProducts(
    ProductsSearched event,
    Emitter<ProductsQueryState> emit,
  ) async {
    emit(const ProductsQueryState());
    await _handlePagination(
      event: event,
      emit: emit,
      request: () async =>
          await _adminRepo.searchProducts(query: event.query, page: state.page),
    );
  }

  Future<void> _fetchMoreProducts(
    ProductsMoreFetched event,
    Emitter<ProductsQueryState> emit,
  ) async {
    await _handlePagination(
      event: event,
      emit: emit,
      request: () async {
        if (state.query?.isNotEmpty ?? false) {
          return await _adminRepo.searchProducts(
            query: state.query!,
            page: state.page,
          );
        }
        return await _adminRepo.readProducts(page: state.page);
      },
    );
  }

  void _refreshProducts(
    ProductsRefreshed event,
    Emitter<ProductsQueryState> emit,
  ) {
    final q = state.query;
    emit(const ProductsQueryState());
    if (q?.isNotEmpty ?? false) {
      add(ProductsSearched(q!));
    } else {
      add(const ProductsFetched());
    }
  }

  Future<void> _handlePagination({
    required ProductsQueryEvent event,
    required Emitter<ProductsQueryState> emit,
    required FutureEither<List<Product>> Function() request,
  }) async {
    if (state.hasReachedMax || state.status.isFailure) return;

    if (state.page == 0) {
      emit(state.copyWith(status: ProductsQueryStatus.loading));
    }

    final result = await request();
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
            query: event is ProductsSearched ? event.query : state.query,
            hasReachedMax: products.length < 10,
            page: state.page + 1,
          ),
        );
      },
    );
  }

  @override
  void onTransition(
    Transition<ProductsQueryEvent, ProductsQueryState> transition,
  ) {
    super.onTransition(transition);

    final eventType = transition.event.runtimeType;
    final currentStatus = transition.currentState.status;
    final nextStatus = transition.nextState.status;

    log('[$runtimeType] $eventType\n$currentStatus → $nextStatus');
  }
}
