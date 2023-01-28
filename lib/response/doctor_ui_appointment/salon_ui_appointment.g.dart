// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_ui_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalonUIAppointment _$SalonUIAppointmentFromJson(Map<String, dynamic> json) {
  return SalonUIAppointment(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => GetSalonUIAppointment.fromJson(e as Map<String, dynamic>))
        .toList(),
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$SalonUIAppointmentToJson(SalonUIAppointment instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
