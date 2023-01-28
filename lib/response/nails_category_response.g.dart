// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nails_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NailsCategoryResponse _$NailsCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return NailsCategoryResponse(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => NailsCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$NailsCategoryResponseToJson(
        NailsCategoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
