import 'package:hospital_management_system/models/nails_category.dart';
import 'package:json_annotation/json_annotation.dart';

part "nails_category_response.g.dart";

@JsonSerializable()
class NailsCategoryResponse {
  bool? success;
  List<NailsCategory>? data;

  NailsCategoryResponse({this.data, this.success});

  factory NailsCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$NailsCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NailsCategoryResponseToJson(this);
}
