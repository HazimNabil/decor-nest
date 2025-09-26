import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/helper/typedefs.dart';

class ProductFilter {
  List<String> categories;
  List<String> woodTypes;
  double minPrice;
  double maxPrice;
  String searchQuery;
  SortBy sortBy;

  ProductFilter({
    required this.categories,
    required this.woodTypes,
    this.minPrice = 0,
    this.maxPrice = 1000,
    this.searchQuery = '',
    this.sortBy = (column: TableConstants.createdAt, ascending: false),
  });

  void clear() {
    categories = [];
    woodTypes = [];
    minPrice = 0;
    maxPrice = 1000;
    sortBy = (column: TableConstants.createdAt, ascending: false);
  }

  int get filterCount {
    int count = 0;
    if (categories.isNotEmpty) count++;
    if (woodTypes.isNotEmpty) count++;
    if (minPrice > 0 || maxPrice < 1000) count++;
    if (sortBy != (column: TableConstants.createdAt, ascending: false)) count++;
    return count;
  }
}
