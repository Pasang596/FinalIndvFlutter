import 'package:hospital_management_system/models/patientModel.dart';
import 'package:json_annotation/json_annotation.dart';
part "get_salon_ui_appointment.g.dart";

@JsonSerializable()
class GetSalonUIAppointment {
  @JsonKey(name: "_id")
  String? id;
  String? department;
  String? date;
  String? time;
  String? salonId;
  String? status;
  String? fullname;
  String? mobile;
  String? email;
  PatientModel? patientId;
  String? price;

  GetSalonUIAppointment(
      {this.salonId,
      this.department,
      this.date,
      this.email,
      this.fullname,
      this.id,
      this.mobile,
      this.patientId,
      this.time,
      this.status,
      this.price});

  factory GetSalonUIAppointment.fromJson(Map<String, dynamic> json) =>
      _$GetSalonUIAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$GetSalonUIAppointmentToJson(this);
}
