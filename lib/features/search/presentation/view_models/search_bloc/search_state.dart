part of 'search_bloc.dart';

enum SearchStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == SearchStatus.loading;
  bool get isSuccess => this == SearchStatus.success;
  bool get isFailure => this == SearchStatus.failure;
}

class SearchState extends Equatable {
  final SearchStatus status;
  final List<Product> products;
  final String? errorMessage;
  final int page;
  final bool hasReachedMax;
  final ProductFilter? filter;
  final int filterCount;

  const SearchState({
    this.status = SearchStatus.initial,
    this.products = const [],
    this.errorMessage,
    this.page = 0,
    this.hasReachedMax = false,
    this.filter,
    this.filterCount = 0,
  });

  @override
  List<Object?> get props => [
    status,
    products,
    errorMessage,
    page,
    hasReachedMax,
    filter,
    filterCount,
  ];

  SearchState copyWith({
    SearchStatus? status,
    List<Product>? products,
    String? errorMessage,
    int? page,
    bool? hasReachedMax,
    ProductFilter? filter,
    int? filterCount,
  }) {
    return SearchState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      filter: filter ?? this.filter,
      filterCount: filterCount ?? this.filterCount,
    );
  }
}
