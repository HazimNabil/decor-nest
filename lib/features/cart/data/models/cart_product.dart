import 'package:decor_nest/core/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_product.g.dart';

@JsonSerializable(includeIfNull: false)
class CartProduct extends Product {
  final int quantity;
  @JsonKey(name: 'total_price')
  final double totalPrice;
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'user_id')
  final String userId;

  CartProduct({
    super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.stock,
    required super.category,
    required super.woodType,
    required super.imageUrl,
    required super.imagePath,
    required this.quantity,
    required this.totalPrice,
    required this.productId,
    required this.userId,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return _$CartProductFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CartProductToJson(this);
  }

  factory CartProduct.fromProduct({
    required Product product,
    required int quantity,
    required String userId,
  }) {
    return CartProduct(
      name: product.name,
      description: product.description,
      price: product.price,
      stock: product.stock,
      category: product.category,
      woodType: product.woodType,
      imageUrl: product.imageUrl,
      imagePath: product.imagePath,
      quantity: quantity,
      totalPrice: product.price * quantity,
      productId: product.id ?? -1,
      userId: userId,
    );
  }
}
