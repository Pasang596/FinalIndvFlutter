import 'package:hospital_management_system/response/doctor_appointment/get_salon_appointment_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'salon_appointment_response_data.g.dart';

@JsonSerializable()
class SalonAppointmentResponseData {
  bool? success;
  List<GetSalonAppointmentResponse>? data;

  SalonAppointmentResponseData({
    this.data,
    this.success,
  });

  factory SalonAppointmentResponseData.fromJson(Map<String, dynamic> json) =>
      _$SalonAppointmentResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$SalonAppointmentResponseDataToJson(this);
}
