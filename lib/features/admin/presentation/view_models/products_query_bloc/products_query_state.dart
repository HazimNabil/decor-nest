part of 'products_query_bloc.dart';

enum ProductsQueryStatus { initial, loading, success, failure }

extension ProductsQueryStatusExtension on ProductsQueryStatus {
  bool get isLoading => this == ProductsQueryStatus.loading;
  bool get isSuccess => this == ProductsQueryStatus.success;
  bool get isFailure => this == ProductsQueryStatus.failure;
}

class ProductsQueryState extends Equatable {
  final ProductsQueryStatus status;
  final List<Product> products;
  final String? errorMessage;
  final int page;
  final bool hasReachedMax;

  const ProductsQueryState({
    this.status = ProductsQueryStatus.initial,
    this.products = const [],
    this.errorMessage,
    this.page = 0,
    this.hasReachedMax = false,
  });

  ProductsQueryState copyWith({
    int? page,
    bool? hasReachedMax,
    ProductsQueryStatus? status,
    List<Product>? products,
    String? errorMessage,
  }) {
    return ProductsQueryState(
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props {
    return [status, products, errorMessage, page, hasReachedMax];
  }
}
