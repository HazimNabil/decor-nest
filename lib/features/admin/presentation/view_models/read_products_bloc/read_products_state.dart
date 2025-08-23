part of 'read_products_bloc.dart';

enum ReadProductsStatus { initial, loading, success, failure }

class ReadProductsState extends Equatable {
  final ReadProductsStatus status;
  final List<Product> products;
  final String? errorMessage;
  final int page;
  final bool hasReachedMax;

  const ReadProductsState({
    this.status = ReadProductsStatus.initial,
    this.products = const [],
    this.errorMessage,
    this.page = 0,
    this.hasReachedMax = false,
  });

  ReadProductsState copyWith({
    int? page,
    bool? hasReachedMax,
    ReadProductsStatus? status,
    List<Product>? products,
    String? errorMessage,
  }) {
    return ReadProductsState(
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
