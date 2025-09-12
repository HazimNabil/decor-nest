import 'package:decor_nest/core/models/base_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_product.g.dart';

@JsonSerializable(includeIfNull: false)
class CartProduct extends BaseProduct {
  final int quantity;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'user_id')
  final String userId;

  CartProduct({
    super.id,
    required super.name,
    required super.price,
    required super.stock,
    required this.quantity,
    this.imageUrl,
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
}
