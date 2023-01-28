import 'package:json_annotation/json_annotation.dart';

part 'nails_category.g.dart';

@JsonSerializable()
class NailsCategory {
  @JsonKey(name: "_id")
  String? id;
  String? name;

  NailsCategory({this.id, this.name});

  factory NailsCategory.fromJson(Map<String, dynamic> json) =>
      _$NailsCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$NailsCategoryToJson(this);
}
