abstract class BaseProduct {
  final int? id;
  final String name;
  final String description;
  final double price;
  final int stock;
  String? imageUrl;
  bool isFavorite;

  BaseProduct({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    this.imageUrl,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson();
}
