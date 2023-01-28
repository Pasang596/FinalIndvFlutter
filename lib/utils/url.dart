const baseUrl = "http://192.168.101.2:90/";
// const baseUrl = "http://localhost:90/";
// const baseUrl = "http://192.168.137.61:90/";

const loginUrl = "patient/login";
const registerUrl = "patient/insert";
const getNailsCategoryUrl = "staff/nailsCategory";
const getAppointmentHDT = "staff/appointment/dateAndtime/";
const getUserDetailsUrl = "patient/dashboard/get";
const bookAppointmentUrl = "patient/bookAppointment/get";
const getBookedAppointmentUrl = "patient/getBookedAppointment/get";
const deleteAppointmentTimeUrl = "staff/appointment/time/delete";
const updateAppointmentUrl = "patient/updateBookedAppointment/get/";
const deleteAppointmentUrl = "patient/deleteBookedAppointment/get/";

const getNailsCateogryIdUrl = "staff/get/nailsCategoryId/";
const reAddAppointmentTimeUrl = "staff/appointment/time/add/";

const getDepartmentSalon = "salon/category/";
const bookSalonAppointmentUrl = "patient/bookSalonAppointment/get";
const getBookedSalonAppointmentUrl = "patient/getBookedSalonAppointment/get";
const deleteBookedSalonAppointmentUrl =
    "patient/deleteBookedSalonAppointment/get/";
const updateSalonAppointmentUrl = "patient/updateBookedSalonAppointment/get/";

const salonLoginUrl = "salon/login";

const updatePatientProfileUrl = "patient/update/get";

const salonAppointmentStatusUrl = "salon/getAppointment/";
const salonAppointmentUpdateStatusUrl = "salon/updateAppointmentStatus/";
const salonGetProfile = "salon/dashboard/single";

const getAllSalon = "salon/dashboard/get/admin";
// const getProductUrl = "";
String? token;
