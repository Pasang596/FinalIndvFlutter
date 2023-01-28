// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_salon_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSalonAppointmentResponse _$GetSalonAppointmentResponseFromJson(
    Map<String, dynamic> json) {
  return GetSalonAppointmentResponse(
    salonId: json['salonId'] == null
        ? null
        : SalonModel.fromJson(json['salonId'] as Map<String, dynamic>),
    department: json['department'] as String?,
    date: json['date'] as String?,
    email: json['email'] as String?,
    fullname: json['fullname'] as String?,
    id: json['_id'] as String?,
    mobile: json['mobile'] as String?,
    patientId: json['patientId'] as String?,
    time: json['time'] as String?,
    status: json['status'] as String?,
    price: json['price'] as String?,
  );
}

Map<String, dynamic> _$GetSalonAppointmentResponseToJson(
        GetSalonAppointmentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'department': instance.department,
      'date': instance.date,
      'time': instance.time,
      'salonId': instance.salonId,
      'status': instance.status,
      'fullname': instance.fullname,
      'mobile': instance.mobile,
      'email': instance.email,
      'patientId': instance.patientId,
      'price': instance.price,
    };
