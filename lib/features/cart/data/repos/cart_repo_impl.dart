import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/services/database_service.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartRepoImpl implements CartRepo {
  final DatabaseService _databaseService;

  CartRepoImpl(this._databaseService);

  @override
  FutureEither<Unit> addToCart(CartProduct cartProduct) async {
    try {
      await _databaseService.add(
        tableName: TableConstants.cart,
        product: cartProduct,
      );

      await _databaseService.update(
        tableName: TableConstants.products,
        id: cartProduct.productId,
        fields: {TableConstants.isInCart: true},
      );

      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }
}
