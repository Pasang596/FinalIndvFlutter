// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_salon_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookSalonAppointment _$BookSalonAppointmentFromJson(Map<String, dynamic> json) {
  return BookSalonAppointment(
    department: json['department'] as String?,
    date: json['date'] as String?,
    time: json['time'] as String?,
    email: json['email'] as String?,
    fullname: json['fullname'] as String?,
    mobile: json['mobile'] as String?,
    salonId: json['salonId'] as String?,
    price: json['price'] as String?,
  );
}

Map<String, dynamic> _$BookSalonAppointmentToJson(
        BookSalonAppointment instance) =>
    <String, dynamic>{
      'department': instance.department,
      'date': instance.date,
      'time': instance.time,
      'fullname': instance.fullname,
      'mobile': instance.mobile,
      'email': instance.email,
      'salonId': instance.salonId,
      'price': instance.price,
    };
