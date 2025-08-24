part of 'products_query_bloc.dart';

sealed class ProductsQueryEvent extends Equatable {
  const ProductsQueryEvent();

  @override
  List<Object> get props => [];
}

final class ProductsFetched extends ProductsQueryEvent {
  const ProductsFetched();

  @override
  List<Object> get props => [];
}

final class ProductsRefreshed extends ProductsQueryEvent {
  const ProductsRefreshed();

  @override
  List<Object> get props => [];
}
