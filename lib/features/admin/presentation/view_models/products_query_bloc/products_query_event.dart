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

final class ProductsSearched extends ProductsQueryEvent {
  final String query;

  const ProductsSearched(this.query);

  @override
  List<Object> get props => [query];
}

final class ProductsMoreFetched extends ProductsQueryEvent {
  const ProductsMoreFetched();

  @override
  List<Object> get props => [];
}
