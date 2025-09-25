class ProductFilter {
  List<String>? categories;
  List<String>? woodTypes;
  double? minPrice;
  double? maxPrice;
  String? searchQuery;
  String? sortBy;
  bool ascending;

  ProductFilter({
    this.categories,
    this.woodTypes,
    this.minPrice,
    this.maxPrice,
    this.searchQuery,
    this.sortBy,
    this.ascending = false,
  });

  void clear() {
    categories = woodTypes = minPrice = maxPrice = sortBy = null;
    ascending = false;
  }
}
