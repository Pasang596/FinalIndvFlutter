import 'package:hospital_management_system/response/doctor_ui_appointment/get_salon_ui_appointment.dart';
import 'package:json_annotation/json_annotation.dart';
part 'salon_ui_appointment.g.dart';

@JsonSerializable()
class SalonUIAppointment {
  bool? success;
  List<GetSalonUIAppointment>? data;

  SalonUIAppointment({
    this.data,
    this.success,
  });

  factory SalonUIAppointment.fromJson(Map<String, dynamic> json) =>
      _$SalonUIAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$SalonUIAppointmentToJson(this);
}
