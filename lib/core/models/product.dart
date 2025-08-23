import 'package:decor_nest/core/helper/app_secrets.dart';
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

  factory Product.dummy() {
    return Product(
      name: 'Product Name',
      description: 'Product Description',
      price: 100,
      stock: 10,
      category: 'Category',
      woodType: 'Wood Type',
      imageUrl:
          '${AppSecrets.supabaseUrl}/storage/v1/object/public/images/products/19e543b8-d1c8-483c-8331-c999ff0c5ee3.jpeg',
      imagePath: '19e543b8-d1c8-483c-8331-c999ff0c5ee3.jpeg',
    );
  }
}
