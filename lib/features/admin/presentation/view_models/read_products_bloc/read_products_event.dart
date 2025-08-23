part of 'read_products_bloc.dart';

sealed class ReadProductsEvent extends Equatable {
  const ReadProductsEvent();

  @override
  List<Object> get props => [];
}

final class ProductsFetched extends ReadProductsEvent {
  const ProductsFetched();

  @override
  List<Object> get props => [];
}
