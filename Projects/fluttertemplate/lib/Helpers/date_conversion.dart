// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:intl/intl.dart';

class Date_Conversions {
  DateTime? convert_stringto_date(String format, String date_str) {
    // ("yyyy-MM-dd hh:mm:ss")
    try {
      DateTime tempDate = DateFormat(format).parse(date_str);
      // print("Sucesffully converted the date");
      // print(tempDate);
      return tempDate;
    } catch (e) {
      print("conversion error");
      return null;
    }
  }

  String? convert_date_tostring(String format, DateTime datetime) {
    // "yyyy-MM-dd hh:mm:ss"

    try {
      String date_str = DateFormat(format).format(datetime);
      return date_str;
    } catch (e) {
      print("conversion error");
      return null;
    }
  }

  String fixnull(String value) {
    // If null, make it ""

    if (value.toString() == "null" || value.toString() == "NULL") {
      return "";
    } else {
      return value;
    }
  }

  int calculate_diff(DateTime dob) {
    final date2 = DateTime.now();
    final difference = date2.difference(dob).inDays;
    return difference;
  }

  String calculate_age(String? dob) {
    DateTime? birthday =
        Date_Conversions().convert_stringto_date("dd/MM/yyyy", dob!);
    int age = (Date_Conversions().calculate_diff(birthday!) / 365).floor();
    return age.toString();
  }

  String getCurrentDate(format) {
    DateTime currdate = DateTime.now();
    String currdate_str = convert_date_tostring(format, currdate).toString();
    return currdate_str;
  }

  int getTimeinmill() {
    final curr_mill = DateTime.now().millisecondsSinceEpoch;
    return curr_mill;
  }

  int getTimeinmillfromDate(DateTime inputdate) {
    final curr_mill = inputdate.millisecondsSinceEpoch;
    return curr_mill;
  }
}
