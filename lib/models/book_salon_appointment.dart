import 'package:json_annotation/json_annotation.dart';
part 'book_salon_appointment.g.dart';

@JsonSerializable()
class BookSalonAppointment {
  String? department;
  String? date;
  String? time;
  String? fullname;
  String? mobile;
  String? email;
  String? salonId;
  String? price;

  BookSalonAppointment({
    this.department,
    this.date,
    this.time,
    this.email,
    this.fullname,
    this.mobile,
    this.salonId,
    this.price,
  });

  factory BookSalonAppointment.fromJson(Map<String, dynamic> json) =>
      _$BookSalonAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$BookSalonAppointmentToJson(this);
}
