// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteProduct _$FavoriteProductFromJson(Map<String, dynamic> json) =>
    FavoriteProduct(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      userId: json['user_id'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$FavoriteProductToJson(FavoriteProduct instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'stock': instance.stock,
      'product_id': instance.productId,
      'user_id': instance.userId,
      'image_url': ?instance.imageUrl,
    };
