import 'package:decor_nest/core/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_product.g.dart';

@JsonSerializable(includeIfNull: false)
class CartProduct extends Product {
  final int quantity;
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'user_id')
  final String userId;

  CartProduct({
    super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.stock,
    required super.category,
    required super.woodType,
    required super.imageUrl,
    required super.imagePath,
    required this.quantity,
    required this.productId,
    required this.userId,
  });

  double get totalPrice => price * quantity;

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return _$CartProductFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CartProductToJson(this);
  }

  factory CartProduct.fromProduct({
    required Product product,
    required int quantity,
    required String userId,
  }) {
    return CartProduct(
      name: product.name,
      description: product.description,
      price: product.price,
      stock: product.stock,
      category: product.category,
      woodType: product.woodType,
      imageUrl: product.imageUrl,
      imagePath: product.imagePath,
      quantity: quantity,
      productId: product.id ?? -1,
      userId: userId,
    );
  }

  CartProduct copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    int? stock,
    String? category,
    String? woodType,
    String? imageUrl,
    String? imagePath,
    int? quantity,
    int? productId,
    String? userId,
  }) {
    return CartProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      category: category ?? this.category,
      woodType: woodType ?? this.woodType,
      imageUrl: imageUrl ?? this.imageUrl,
      imagePath: imagePath ?? this.imagePath,
      quantity: quantity ?? this.quantity,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
    );
  }
}
