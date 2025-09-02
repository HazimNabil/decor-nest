import 'dart:io' show File;

import 'package:json_annotation/json_annotation.dart';

part 'product_input_data.g.dart';

@JsonSerializable(includeIfNull: false, createFactory: false)
class ProductInputData {
  String? name;
  String? description;
  double? price;
  int? stock;
  String? category;
  @JsonKey(name: 'wood_type')
  String? woodType;
  @JsonKey(includeToJson: false)
  File? image;

  Map<String, dynamic> toJson() {
    final json = _$ProductInputDataToJson(this);
    json.removeWhere((key, value) => value is String ? value.isEmpty : false);
    return json;
  }
}
