// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_salon_ui_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSalonUIAppointment _$GetSalonUIAppointmentFromJson(
    Map<String, dynamic> json) {
  return GetSalonUIAppointment(
    salonId: json['salonId'] as String?,
    department: json['department'] as String?,
    date: json['date'] as String?,
    email: json['email'] as String?,
    fullname: json['fullname'] as String?,
    id: json['_id'] as String?,
    mobile: json['mobile'] as String?,
    patientId: json['patientId'] == null
        ? null
        : PatientModel.fromJson(json['patientId'] as Map<String, dynamic>),
    time: json['time'] as String?,
    status: json['status'] as String?,
    price: json['price'] as String?,
  );
}

Map<String, dynamic> _$GetSalonUIAppointmentToJson(
        GetSalonUIAppointment instance) =>
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
