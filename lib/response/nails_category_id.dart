import 'package:json_annotation/json_annotation.dart';
part 'nails_category_id.g.dart';

@JsonSerializable()
class NailsCategoryId {
  bool? success;
  dynamic data;

  NailsCategoryId({this.data, this.success});

  factory NailsCategoryId.fromJson(Map<String, dynamic> json) =>
      _$NailsCategoryIdFromJson(json);

  Map<String, dynamic> toJson() => _$NailsCategoryIdToJson(this);
}
