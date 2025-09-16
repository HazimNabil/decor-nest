// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteProduct _$FavoriteProductFromJson(Map<String, dynamic> json) =>
    FavoriteProduct(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
      woodType: json['wood_type'] as String?,
      imageUrl: json['image_url'] as String?,
      imagePath: json['image_path'] as String?,
      productId: (json['product_id'] as num).toInt(),
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$FavoriteProductToJson(FavoriteProduct instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': instance.name,
      'price': instance.price,
      'stock': instance.stock,
      'description': instance.description,
      'category': instance.category,
      'wood_type': ?instance.woodType,
      'image_url': ?instance.imageUrl,
      'image_path': ?instance.imagePath,
      'product_id': instance.productId,
      'user_id': instance.userId,
    };
