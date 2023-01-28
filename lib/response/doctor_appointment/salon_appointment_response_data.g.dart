// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_appointment_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalonAppointmentResponseData _$SalonAppointmentResponseDataFromJson(
    Map<String, dynamic> json) {
  return SalonAppointmentResponseData(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) =>
            GetSalonAppointmentResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$SalonAppointmentResponseDataToJson(
        SalonAppointmentResponseData instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
