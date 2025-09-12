part of 'fetch_products_bloc.dart';

sealed class FetchProductsEvent extends Equatable {
  const FetchProductsEvent();

  @override
  List<Object?> get props => [];
}

final class ProductsFetched extends FetchProductsEvent {
  final String? category;

  const ProductsFetched({this.category});

  @override
  List<Object?> get props => [category];
}

final class ProductsMoreFetched extends FetchProductsEvent {
  const ProductsMoreFetched();
}
