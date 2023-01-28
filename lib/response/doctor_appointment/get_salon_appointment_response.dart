import 'package:hospital_management_system/models/doctorModel.dart';
import 'package:json_annotation/json_annotation.dart';
part "get_salon_appointment_response.g.dart";

@JsonSerializable()
class GetSalonAppointmentResponse {
  @JsonKey(name: "_id")
  String? id;
  String? department;
  String? date;
  String? time;
  SalonModel? salonId;
  String? status;
  String? fullname;
  String? mobile;
  String? email;
  String? patientId;
  String? price;

  GetSalonAppointmentResponse({
    this.salonId,
    this.department,
    this.date,
    this.email,
    this.fullname,
    this.id,
    this.mobile,
    this.patientId,
    this.time,
    this.status,
    this.price,
  });

  factory GetSalonAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSalonAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSalonAppointmentResponseToJson(this);
}
