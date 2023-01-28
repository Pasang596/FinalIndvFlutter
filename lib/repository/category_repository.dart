import 'package:hospital_management_system/api/category_api.dart';
import 'package:hospital_management_system/models/appointment_hdt_model.dart';
import 'package:hospital_management_system/models/book_appointment.dart';
import 'package:hospital_management_system/models/book_salon_appointment.dart';
import 'package:hospital_management_system/models/doctorModel.dart';
import 'package:hospital_management_system/models/nails_category.dart';
import 'package:hospital_management_system/response/appointment_response.dart';
import 'package:hospital_management_system/response/doctor_appointment/get_salon_appointment_response.dart';
import 'package:hospital_management_system/response/doctor_ui_appointment/get_salon_ui_appointment.dart';

class CategoryRepository {
  Future<List<NailsCategory?>> loadNailsCategory() {
    return CategoryAPI().loadNailsCategory();
  }

  Future<List<AppointmentHDTModel?>> loadAppointmentHDT(
      String nailsCategoryID) {
    return CategoryAPI().loadAppointmentHDT(nailsCategoryID);
  }

  Future<bool> bookAppointment(BookAppointment appointment) async {
    return await CategoryAPI().bookAppointment(appointment);
  }

  Future<List<AppointmentResponse?>> getBookedAppointment() async {
    return await CategoryAPI().getBookedAppointment();
  }

  Future<bool> deleteTime(
      String nailsCategoryID, String date, String time) async {
    return await CategoryAPI().deleteTime(nailsCategoryID, date, time);
  }

  Future<bool> reAddAppointmentTime(
      String nailsCategoryID, String date, String time) async {
    return await CategoryAPI()
        .reAddAppointmentTime(nailsCategoryID, date, time);
  }

  Future<bool> updateAppointment(
      AppointmentResponse appointmentResponse) async {
    return await CategoryAPI().updateAppointment(appointmentResponse);
  }

  Future<bool> deleteAppointment(String appointmentId) async {
    return await CategoryAPI().deleteAppointment(appointmentId);
  }

  Future<NailsCategory?> getNailsCategoryId(String name) async {
    return await CategoryAPI().getNailsCategoryId(name);
  }

  Future<List<SalonModel?>> loadDepartmentSalon(String department) {
    return CategoryAPI().loadDepartmentSalon(department);
  }

  Future<List<SalonModel?>> loadAllSalon() {
    return CategoryAPI().loadAllSalon();
  }

  Future<bool> bookSalonAppointment(BookSalonAppointment appointment) async {
    return await CategoryAPI().bookSalonAppointment(appointment);
  }

  Future<List<GetSalonAppointmentResponse?>> getBookedSalonAppointment() async {
    return await CategoryAPI().getBookedSalonAppointment();
  }

  Future<bool> deleteSalonAppointment(String appointmentId) async {
    return await CategoryAPI().deleteSalonAppointment(appointmentId);
  }

  Future<bool> updateSalonAppointment(
      GetSalonAppointmentResponse appointment, String status) async {
    return await CategoryAPI().updateSalonAppointment(appointment, status);
  }

  Future<List<GetSalonUIAppointment?>> getSalonUIAppointment(
      String status) async {
    return await CategoryAPI().getSalonUIAppointment(status);
  }

  Future<bool> updateSalonUIAppointment(String id, String status) async {
    return await CategoryAPI().updateSalonUIAppointment(id, status);
  }
}
