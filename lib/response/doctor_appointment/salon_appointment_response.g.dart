// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalonAppointmentResponse _$SalonAppointmentResponseFromJson(
    Map<String, dynamic> json) {
  return SalonAppointmentResponse(
    details: (json['details'] as List<dynamic>?)
        ?.map((e) => SalonModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SalonAppointmentResponseToJson(
        SalonAppointmentResponse instance) =>
    <String, dynamic>{
      'details': instance.details,
    };
