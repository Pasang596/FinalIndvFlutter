//  import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/book_salon_appointment/appointment_details_screen.dart';
import 'package:hospital_management_system/screens/book_salon_appointment/google_map.dart';
import 'package:hospital_management_system/screens/book_salon_appointment/search_select_salon.dart';
import 'package:hospital_management_system/screens/book_salon_appointment/select_department.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:hospital_management_system/screens/home_screen.dart';
import 'package:hospital_management_system/screens/login_page.dart';
import 'package:hospital_management_system/screens/register_page.dart';
import 'package:hospital_management_system/screens/update_appointment.dart';
import 'package:hospital_management_system/screens/update_salon_appointment.dart';

void main() {
  // AwesomeNotifications().initialize(
  //   "",
  //   [
  //     NotificationChannel(
  //       channelGroupKey: 'basic_channel_group',
  //       channelKey: 'basic_channel',
  //       channelName: 'Basic Notification',
  //       channelDescription: 'Notification channel for basic tests',
  //       defaultColor: Colors.transparent,
  //       importance: NotificationImportance.High,
  //       channelShowBadge: true,
  //     ),
  //   ],
  // );
  runApp(
    MaterialApp(
      // theme: ThemeData(fontFamily: "Roboto"),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        // '/splash': (context) => const SplashScreen(),
        '/bottomNavBar': (context) => const BottomNavBar(),
        '/login': (context) => const LoginPageScreen(),
        '/registerPage': (context) => const RegisterPageScreen(),
        '/homeScreen': (context) => const HomeScreen(),
        "/updateAppointmentScreen": (context) =>
            const UpdateAppointmentScreen(),
        '/salonDepartmentScreen': (context) => const SalonDepartmentScreen(),
        '/searchSalon': (context) => const SearchSalon(),
        '/appointmentSalonDetailsScreen': (context) =>
            const AppointmentSalonDetailsScreen(),
        '/updateAppointmentSalon': (context) => const UpdateAppointmentSalon(),
        // '/patientProfileUpdate': (context) => const PatientProfileUpdate(),

        '/salonGoogleMap': (context) => const MyMapScreen(),

        // Wear OS
      },
    ),
  );
}
