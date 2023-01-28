// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nails_category_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NailsCategoryId _$NailsCategoryIdFromJson(Map<String, dynamic> json) {
  return NailsCategoryId(
    data: json['data'],
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$NailsCategoryIdToJson(NailsCategoryId instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
