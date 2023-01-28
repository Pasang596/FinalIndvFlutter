import 'package:hospital_management_system/models/doctorModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'salon_appointment_response.g.dart';

@JsonSerializable()
class SalonAppointmentResponse {
  List<SalonModel>? details;

  SalonAppointmentResponse({this.details});

  factory SalonAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$SalonAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SalonAppointmentResponseToJson(this);
}
