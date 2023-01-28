// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_hdt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentHDTModel _$AppointmentHDTModelFromJson(Map<String, dynamic> json) {
  return AppointmentHDTModel(
    id: json['_id'] as String?,
    nailsCategoryID: json['nailsCategoryID'] as String?,
    date: json['date'] as String?,
    time: (json['time'] as List<dynamic>).map((e) => e as String?).toList(),
  );
}

Map<String, dynamic> _$AppointmentHDTModelToJson(
        AppointmentHDTModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nailsCategoryID': instance.nailsCategoryID,
      'date': instance.date,
      'time': instance.time,
    };
