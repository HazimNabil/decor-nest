// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: (json['id'] as num?)?.toInt(),
  userId: json['user_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  totalPrice: (json['total_price'] as num).toDouble(),
  itemCount: (json['item_count'] as num).toInt(),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': ?instance.id,
  'user_id': instance.userId,
  'created_at': instance.createdAt.toIso8601String(),
  'total_price': instance.totalPrice,
  'item_count': instance.itemCount,
};
