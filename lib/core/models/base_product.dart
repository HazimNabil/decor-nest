abstract class BaseProduct {
  final int? id;
  final String name;
  final String description;
  final double price;
  final int stock;

  BaseProduct({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
  });

  Map<String, dynamic> toJson();
}
