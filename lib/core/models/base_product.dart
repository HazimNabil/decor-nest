abstract class BaseProduct {
  final int? id;
  final String name;
  final double price;
  final int stock;

  BaseProduct({
    this.id,
    required this.name,
    required this.price,
    required this.stock,
  });

  Map<String, dynamic> toJson();
}
