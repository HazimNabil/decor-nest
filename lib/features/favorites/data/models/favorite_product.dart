// ignore_for_file: overridden_fields

import 'package:decor_nest/core/models/base_product.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_product.g.dart';

@JsonSerializable(includeIfNull: false)
class FavoriteProduct extends BaseProduct {
  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'user_id')
  final String userId;

  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  FavoriteProduct({
    required super.name,
    required super.description,
    required super.price,
    required super.stock,
    required this.productId,
    required this.userId,
    this.imageUrl,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return _$FavoriteProductFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$FavoriteProductToJson(this);
  }

  factory FavoriteProduct.fromProduct(Product product, String userId) {
    return FavoriteProduct(
      name: product.name,
      description: product.description,
      price: product.price,
      stock: product.stock,
      productId: product.id!,
      userId: userId,
      imageUrl: product.imageUrl,
    );
  }
}
