// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
  category: json['category'] as String,
  woodType: json['wood_type'] as String?,
  imageUrl: json['image_url'] as String?,
  imagePath: json['image_path'] as String?,
  isFavorite: json['is_favorite'] as bool? ?? false,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'stock': instance.stock,
  'category': instance.category,
  'wood_type': ?instance.woodType,
  'image_url': ?instance.imageUrl,
  'image_path': ?instance.imagePath,
  'is_favorite': instance.isFavorite,
};
