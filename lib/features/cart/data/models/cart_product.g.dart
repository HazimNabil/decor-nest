// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProduct _$CartProductFromJson(Map<String, dynamic> json) => CartProduct(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  imageUrl: json['image_url'] as String?,
  productId: (json['product_id'] as num).toInt(),
  userId: json['user_id'] as String,
);

Map<String, dynamic> _$CartProductToJson(CartProduct instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': instance.name,
      'price': instance.price,
      'stock': instance.stock,
      'quantity': instance.quantity,
      'image_url': ?instance.imageUrl,
      'product_id': instance.productId,
      'user_id': instance.userId,
    };
