part of 'fetch_products_bloc.dart';

enum FetchProductsStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == FetchProductsStatus.loading;
  bool get isSuccess => this == FetchProductsStatus.success;
  bool get isFailure => this == FetchProductsStatus.failure;
}

class FetchProductsState extends Equatable {
  final FetchProductsStatus status;
  final List<Product> products;
  final String? errorMessage;
  final String? category;
  final int page;
  final bool hasReachedMax;

  const FetchProductsState({
    this.status = FetchProductsStatus.initial,
    this.products = const [],
    this.errorMessage,
    this.category,
    this.page = 0,
    this.hasReachedMax = false,
  });

  FetchProductsState copyWith({
    FetchProductsStatus? status,
    List<Product>? products,
    String? errorMessage,
    String? category,
    int? page,
    bool? hasReachedMax,
  }) {
    return FetchProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      category: category ?? this.category,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [
    status,
    products,
    errorMessage,
    category,
    page,
    hasReachedMax,
  ];
}
