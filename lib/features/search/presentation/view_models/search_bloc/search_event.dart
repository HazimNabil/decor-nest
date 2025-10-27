part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

final class ProductsSearched extends SearchEvent {
  final ProductFilter? filter;

  const ProductsSearched(this.filter);

  @override
  List<Object?> get props => [filter];
}

final class ProductsMoreSearched extends SearchEvent {
  const ProductsMoreSearched();

  @override
  List<Object?> get props => [];
}
