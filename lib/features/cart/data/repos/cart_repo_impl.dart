import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/errors/failure.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/services/database_service.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartRepoImpl implements CartRepo {
  final DatabaseService _databaseService;

  CartRepoImpl(this._databaseService);

  @override
  FutureEither<Unit> addToCart(Product product) async {
    try {
      await _databaseService.add(
        tableName: TableConstants.cart,
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
  Future<bool> isInCart(Product product) async {
    try {
      final userId = await CacheHelper.getSecureData(CacheConstants.userId);
      return await _databaseService.isFound(
        tableName: TableConstants.cart,
        productId: product.id!,
        userId: userId,
      );
    } catch (e) {
      return false;
    }
  }

  @override
  FutureEither<Unit> removeFromCart(CartProduct cartProduct) async {
    try {
      await _databaseService.deleteByFields(
        tableName: TableConstants.cart,
        fields: {
          TableConstants.userId: cartProduct.userId,
          TableConstants.productId: cartProduct.productId,
        },
      );

      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  StreamEither<List<CartProduct>> watchCart() {
    try {
      return _databaseService
          .stream(tableName: TableConstants.cart)
          .map(_parseJson);
    } on PostgrestException catch (e) {
      return Stream.value(left(DatabaseFailure.fromException(e)));
    } catch (e) {
      return Stream.value(left(DatabaseFailure(e.toString())));
    }
  }

  Either<Failure, List<CartProduct>> _parseJson(
    List<Map<String, dynamic>> jsonCartProducts,
  ) {
    try {
      final cartProducts = jsonCartProducts
          .map((json) => CartProduct.fromJson(json))
          .toList();
      return right(cartProducts);
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }
}
