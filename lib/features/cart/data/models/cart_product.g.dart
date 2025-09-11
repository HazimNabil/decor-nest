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
  imageUrl: json['imageUrl'] as String?,
  productId: (json['productId'] as num).toInt(),
  userId: json['userId'] as String,
);

Map<String, dynamic> _$CartProductToJson(CartProduct instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': instance.name,
      'price': instance.price,
      'stock': instance.stock,
      'quantity': instance.quantity,
      'imageUrl': ?instance.imageUrl,
      'productId': instance.productId,
      'userId': instance.userId,
    };
