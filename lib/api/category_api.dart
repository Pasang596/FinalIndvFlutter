import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/api/http_services.dart';
import 'package:hospital_management_system/models/appointment_hdt_model.dart';
import 'package:hospital_management_system/models/book_appointment.dart';
import 'package:hospital_management_system/models/book_salon_appointment.dart';
import 'package:hospital_management_system/models/doctorModel.dart';
import 'package:hospital_management_system/models/nails_category.dart';
import 'package:hospital_management_system/response/appointment_hdt_response.dart';
import 'package:hospital_management_system/response/appointment_response.dart';
import 'package:hospital_management_system/response/book_appointment_response.dart';
import 'package:hospital_management_system/response/doctor_appointment/get_salon_appointment_response.dart';
import 'package:hospital_management_system/response/doctor_appointment/salon_appointment_response.dart';
import 'package:hospital_management_system/response/doctor_appointment/salon_appointment_response_data.dart';
import 'package:hospital_management_system/response/doctor_ui_appointment/get_salon_ui_appointment.dart';
import 'package:hospital_management_system/response/doctor_ui_appointment/salon_ui_appointment.dart';
import 'package:hospital_management_system/response/nails_category_id.dart';
import 'package:hospital_management_system/response/nails_category_response.dart';
import 'package:hospital_management_system/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryAPI {
  Future<List<NailsCategory?>> loadNailsCategory() async {
    List<NailsCategory?> nailsCateogryList = [];
    Response response;
    var url = baseUrl + getNailsCategoryUrl;

    var dio = HttpServices().getDioInstance();
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
    try {
      response = await dio.get(
        url,
        options: buildCacheOptions(const Duration(days: 7)),
      );
      debugPrint(response.toString());

      if (response.statusCode == 201) {
        NailsCategoryResponse nailsCategoryResponse =
            NailsCategoryResponse.fromJson(response.data);

        for (var data in nailsCategoryResponse.data!) {
          nailsCateogryList.add(
            NailsCategory(
              id: data.id,
              name: data.name,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }

    return nailsCateogryList;
  }

  Future<List<AppointmentHDTModel?>> loadAppointmentHDT(
      String nailsCategoryID) async {
    List<AppointmentHDTModel?> appointmentHDTList = [];
    Response response;
    var url = baseUrl + getAppointmentHDT;

    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(url + nailsCategoryID);

      if (response.statusCode == 201) {
        AppointmentHDTResponse appointmentHDTResponse =
            AppointmentHDTResponse.fromJson(response.data);

        for (var data in appointmentHDTResponse.data!) {
          appointmentHDTList.add(
            AppointmentHDTModel(
              id: data.id,
              nailsCategoryID: data.nailsCategoryID,
              date: data.date,
              time: data.time,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }

    return appointmentHDTList;
  }

  Future<bool> bookAppointment(BookAppointment appointment) async {
    bool? isBooked = false;
    Response response;
    String url = baseUrl + bookAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      response = await dio.post(
        url,
        data: appointment.toJson(),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isBooked;
  }

  Future<List<AppointmentResponse?>> getBookedAppointment() async {
    List<AppointmentResponse?> appointmentResponseList = [];
    Response response;
    String? url = baseUrl + getBookedAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      debugPrint("Token: " + token!);
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      debugPrint("Category API Response :" + response.data.toString());
      if (response.statusCode == 201) {
        BookAppointmentResponse bookAppointmentResponse =
            BookAppointmentResponse.fromJson(response.data);
        for (var data in bookAppointmentResponse.data!) {
          appointmentResponseList.add(AppointmentResponse(
            appointmentFor: data.appointmentFor,
            category: data.category,
            date: data.date,
            email: data.email,
            fullname: data.fullname,
            id: data.id,
            mobile: data.mobile,
            patientId: data.patientId,
            time: data.time,
            visitPurpose: data.visitPurpose,
          ));
        }
      }
    } catch (e) {
      debugPrint("Failed to get data:: ${e.toString()}");
    }
    return appointmentResponseList;
  }

  Future<bool> deleteTime(
      String nailsCategoryID, String date, String time) async {
    bool isDeleted = false;
    Response response;
    String url = baseUrl + deleteAppointmentTimeUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      response = await dio.put(
        url,
        data: {
          "nailsCategoryID": nailsCategoryID,
          "date": date,
          "time": time,
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isDeleted;
  }

  Future<bool> reAddAppointmentTime(
      String nailsCategoryID, String date, String time) async {
    bool? isAdded = false;
    String url = baseUrl + reAddAppointmentTimeUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.put(
        url + nailsCategoryID,
        data: {
          "date": date,
          "time": time,
        },
      );
      // debugPrint("Response: " + response.data.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isAdded;
  }

  Future<bool> updateAppointment(
      AppointmentResponse appointmentResponse) async {
    bool isUpdated = false;
    Response response;
    String url = baseUrl + updateAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    debugPrint(appointmentResponse.id);
    debugPrint(appointmentResponse.fullname);
    debugPrint(appointmentResponse.mobile);
    debugPrint(appointmentResponse.email);
    debugPrint(appointmentResponse.appointmentFor);

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      response = await dio.put(
        url + appointmentResponse.id!,
        data: {
          "fullname": appointmentResponse.fullname,
          "mobile": appointmentResponse.mobile,
          "email": appointmentResponse.email,
          "appointmentFor": appointmentResponse.appointmentFor,
        },
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isUpdated;
  }

  Future<NailsCategory?> getNailsCategoryId(String name) async {
    String url = baseUrl + getNailsCateogryIdUrl;
    Dio dio = HttpServices().getDioInstance();
    NailsCategory? nailsCategory;
    try {
      Response response = await dio.get(url + name);
      // debugPrint("datadddddddddddddddddddddd" + response.data.toString());

      if (response.statusCode == 200) {
        NailsCategoryId nailsCategoryId =
            NailsCategoryId.fromJson(response.data);

        nailsCategory = NailsCategory.fromJson(nailsCategoryId.data);
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return nailsCategory;
  }

  Future<bool> deleteAppointment(String appointmentId) async {
    bool isDeleted = false;
    String url = baseUrl + deleteAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      Response response = await dio.delete(
        url + appointmentId,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isDeleted;
  }

  // -----------------------------Salon Part Started---------------------------------------------------------------------------
  Future<List<SalonModel?>> loadDepartmentSalon(String department) async {
    List<SalonModel?> salonAppointmentList = [];
    Response response;
    var url = baseUrl + getDepartmentSalon;

    var dio = HttpServices().getDioInstance();
    // debugPrint(department);
    try {
      response = await dio.get(url + department);
      // debugPrint(response.data.toString());

      if (response.statusCode == 200) {
        SalonAppointmentResponse salonAppointmentResponse =
            SalonAppointmentResponse.fromJson(response.data);
        // debugPrint(salonAppointmentResponse.details![0].toString());

        for (var data in salonAppointmentResponse.details!) {
          salonAppointmentList.add(
            SalonModel(
              id: data.id,
              fname: data.fname,
              lname: data.lname,
              gender: data.gender,
              age: data.age,
              username: data.username,
              email: data.email,
              phone: data.phone,
              address: data.address,
              password: data.password,
              department: data.department,
              picture: data.picture,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get Department:::: $e');
    }
    // debugPrint(salonAppointmentList.toString());
    return salonAppointmentList;
  }

  Future<List<SalonModel?>> loadAllSalon() async {
    List<SalonModel?> salonAppointmentList = [];
    Response response;
    var url = baseUrl + getAllSalon;

    var dio = HttpServices().getDioInstance();
    // debugPrint(department);
    try {
      response = await dio.get(url);
      debugPrint(response.data.toString());

      if (response.statusCode == 200) {
        SalonAppointmentResponse salonAppointmentResponse =
            SalonAppointmentResponse.fromJson(response.data);
        // debugPrint(salonAppointmentResponse.details![0].toString());

        for (var data in salonAppointmentResponse.details!) {
          salonAppointmentList.add(
            SalonModel(
              id: data.id,
              fname: data.fname,
              lname: data.lname,
              gender: data.gender,
              age: data.age,
              username: data.username,
              email: data.email,
              phone: data.phone,
              address: data.address,
              password: data.password,
              department: data.department,
              picture: data.picture,
              lat: data.lat,
              lng: data.lng,
              price: data.price,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get Department:::: $e');
    }
    // debugPrint(salonAppointmentList.toString());
    return salonAppointmentList;
  }

  Future<bool> bookSalonAppointment(BookSalonAppointment appointment) async {
    bool? isBooked = false;
    Response response;
    String url = baseUrl + bookSalonAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      response = await dio.post(
        url,
        data: appointment.toJson(),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isBooked;
  }

  Future<List<GetSalonAppointmentResponse?>> getBookedSalonAppointment() async {
    List<GetSalonAppointmentResponse?> appointmentResponseList = [];
    Response response;
    String? url = baseUrl + getBookedSalonAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      debugPrint("Token: " + token!);
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      debugPrint("Category API Response :" + response.data.toString());
      if (response.statusCode == 200) {
        SalonAppointmentResponseData bookAppointmentResponse =
            SalonAppointmentResponseData.fromJson(response.data);
        for (var data in bookAppointmentResponse.data!) {
          appointmentResponseList.add(GetSalonAppointmentResponse(
            id: data.id,
            patientId: data.patientId,
            salonId: data.salonId,
            date: data.date,
            email: data.email,
            fullname: data.fullname,
            mobile: data.mobile,
            time: data.time,
            status: data.status,
            department: data.department,
            price: data.price,
          ));
        }
      }
    } catch (e) {
      debugPrint("Failed to get data:: ${e.toString()}");
    }
    return appointmentResponseList;
  }

  Future<bool> deleteSalonAppointment(String appointmentId) async {
    bool isDeleted = false;
    String url = baseUrl + deleteBookedSalonAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      Response response = await dio.delete(
        url + appointmentId,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isDeleted;
  }

  Future<bool> updateSalonAppointment(
      GetSalonAppointmentResponse appointment, String status) async {
    bool? isBooked = false;
    Response response;
    String url = baseUrl + updateSalonAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      response = await dio.put(
        url + appointment.id!,
        data: {
          "price": appointment.price,
          "status": status,
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isBooked;
  }

  // -------------------------------- Salon UI part API ----------------------------------------------------------------------

  Future<List<GetSalonUIAppointment?>> getSalonUIAppointment(
      String status) async {
    List<GetSalonUIAppointment?> appointmentResponseList = [];
    Response response;
    String? url = baseUrl + salonAppointmentStatusUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("salon");
      debugPrint("Token: " + token!);
      response = await dio.get(
        url + status,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint("Category API UI Response :" + response.data.toString());
      if (response.statusCode == 200) {
        SalonUIAppointment bookAppointmentResponse =
            SalonUIAppointment.fromJson(response.data);
        for (var data in bookAppointmentResponse.data!) {
          appointmentResponseList.add(GetSalonUIAppointment(
            id: data.id,
            patientId: data.patientId,
            salonId: data.salonId,
            date: data.date,
            email: data.email,
            fullname: data.fullname,
            mobile: data.mobile,
            time: data.time,
            status: data.status,
            department: data.department,
            price: data.price,
          ));
        }
      }
    } catch (e) {
      debugPrint("Failed to get data:: ${e.toString()}");
    }
    return appointmentResponseList;
  }

  Future<bool> updateSalonUIAppointment(String id, String status) async {
    bool isUpdated = false;
    Response response;
    String? url = baseUrl + salonAppointmentUpdateStatusUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("salon");
      debugPrint("Token: " + token!);
      var data = {"appointmentStatus": status};
      response = await dio.put(
        url + id,
        data: data,
        // options: Options(
        //   headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        // ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error in Updating appointment");
    }
    return isUpdated;
  }
}
