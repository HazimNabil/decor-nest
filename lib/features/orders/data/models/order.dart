import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(includeIfNull: false)
class Order {
  final int? id;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'total_price')
  final double totalPrice;

  @JsonKey(name: 'item_count')
  final int itemCount;

  const Order({
    this.id,
    required this.userId,
    required this.createdAt,
    required this.totalPrice,
    required this.itemCount,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  factory Order.dummy() {
    return Order(
      id: 1,
      userId: '1',
      createdAt: DateTime.now(),
      totalPrice: 0,
      itemCount: 0,
    );
  }
}
