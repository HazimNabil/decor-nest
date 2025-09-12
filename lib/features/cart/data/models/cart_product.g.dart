// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProduct _$CartProductFromJson(Map<String, dynamic> json) => CartProduct(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
  category: json['category'] as String,
  woodType: json['wood_type'] as String?,
  imageUrl: json['image_url'] as String?,
  imagePath: json['image_path'] as String?,
  isFavorite: json['is_favorite'] as bool,
  isInCart: json['is_in_cart'] as bool? ?? true,
  quantity: (json['quantity'] as num).toInt(),
  totalPrice: (json['total_price'] as num).toDouble(),
  productId: (json['product_id'] as num).toInt(),
  userId: json['user_id'] as String,
);

Map<String, dynamic> _$CartProductToJson(CartProduct instance) =>
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
      'is_favorite': instance.isFavorite,
      'is_in_cart': instance.isInCart,
      'quantity': instance.quantity,
      'total_price': instance.totalPrice,
      'product_id': instance.productId,
      'user_id': instance.userId,
    };
