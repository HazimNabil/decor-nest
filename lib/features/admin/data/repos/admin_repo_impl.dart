import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/services/database_service.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show PostgrestException;

class AdminRepoImpl implements AdminRepo {
  final DatabaseService _databaseService;

  const AdminRepoImpl(this._databaseService);

  @override
  FutureEither<Unit> addProduct(Product product) async {
    try {
      await _databaseService.add(
        tableName: TableNames.products,
        product: product,
      );

      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  FutureEither<Unit> deleteProduct(int id) async {
    try {
      await _databaseService.delete(tableName: TableNames.products, id: id);
      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  FutureEither<List<Product>> readProducts(int page) async {
    try {
      final jsonProducts = await _databaseService.read(
        tableName: TableNames.products,
        page: page,
      );

      final products = jsonProducts
          .map((jsonProduct) => Product.fromJson(jsonProduct))
          .toList();

      return right(products);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  FutureEither<List<Product>> searchProducts(String query, int page) async {
    try {
      final jsonProducts = await _databaseService.search(
        tableName: TableNames.products,
        query: query,
        page: page,
      );

      final products = jsonProducts
          .map((jsonProduct) => Product.fromJson(jsonProduct))
          .toList();

      return right(products);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  FutureEither<Unit> updateProduct(int id, Map<String, dynamic> fields) async {
    try {
      await _databaseService.update(
        tableName: TableNames.products,
        id: id,
        fields: fields,
      );

      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }
}
