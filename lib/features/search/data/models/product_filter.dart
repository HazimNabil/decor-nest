import 'package:decor_nest/core/constants/database_constants.dart';

class ProductFilter {
  List<String> categories;
  List<String> woodTypes;
  double minPrice;
  double maxPrice;
  String searchQuery;
  String sortBy;
  bool ascending;

  ProductFilter({
    required this.categories,
    required this.woodTypes,
    this.minPrice = 0,
    this.maxPrice = 1000,
    this.searchQuery = '',
    this.sortBy = TableConstants.createdAt,
    this.ascending = false,
  });

  void clear() {
    categories = [];
    woodTypes = [];
    minPrice = 0;
    maxPrice = 1000;
    searchQuery = '';
    sortBy = TableConstants.createdAt;
    ascending = false;
  }
}
