import 'package:decor_nest/core/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_product.g.dart';

@JsonSerializable(includeIfNull: false)
class FavoriteProduct extends Product {
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'user_id')
  final String userId;

  FavoriteProduct({
    super.id,
    required super.name,
    required super.description,
    required super.category,
    required super.price,
    required super.stock,
    required super.woodType,
    required super.imageUrl,
    required super.imagePath,
    required this.productId,
    required this.userId,
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
      category: product.category,
      woodType: product.woodType,
      imageUrl: product.imageUrl,
      imagePath: product.imagePath,
      productId: product.id ?? -1,
      userId: userId,
    );
  }

  Product toProduct() {
    return Product(
      id: productId,
      name: name,
      description: description,
      price: price,
      stock: stock,
      category: category,
      woodType: woodType,
      imageUrl: imageUrl,
      imagePath: imagePath,
    );
  }
}
