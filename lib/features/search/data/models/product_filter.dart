class ProductFilter {
  final List<String>? category;
  final List<String>? woodType;
  final double? minPrice;
  final double? maxPrice;
  final String? searchQuery;
  final String? sortBy;
  final bool ascending;

  const ProductFilter({
    this.category,
    this.woodType,
    this.minPrice,
    this.maxPrice,
    this.searchQuery,
    this.sortBy,
    this.ascending = false,
  });

  ProductFilter copyWith({
    List<String>? category,
    List<String>? woodType,
    double? minPrice,
    double? maxPrice,
    String? searchQuery,
    String? sortBy,
    bool? ascending,
  }) {
    return ProductFilter(
      category: category ?? this.category,
      woodType: woodType ?? this.woodType,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      searchQuery: searchQuery ?? this.searchQuery,
      sortBy: sortBy ?? this.sortBy,
      ascending: ascending ?? this.ascending,
    );
  }

  ProductFilter clear() {
    return const ProductFilter();
  }
}
