import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(includeIfNull: false)
class Product {
  final int? id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String category;
  @JsonKey(name: 'wood_type')
  final String? woodType;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'image_path')
  String? imagePath;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    this.woodType,
    this.imageUrl,
    this.imagePath,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
