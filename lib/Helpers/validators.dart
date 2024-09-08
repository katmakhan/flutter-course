import 'package:get/get.dart';

class Validators {
  // Validates that the name is not empty and only contains alphabets and spaces
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return "Name can only contain alphabets and spaces";
    }
    return null;
  }

  // Validates if the input is a valid email address
  static String? validateEmail(String? value) {
    if (value == null || !GetUtils.isEmail(value)) {
      return "Provide a valid email";
    }
    return null;
  }

  // Validates if the input is a valid phone number (assuming 10 digits)
  static String? validatePhone(String? value) {
    if (value == null || !GetUtils.isPhoneNumber(value)) {
      return "Phone number must be 10 digits";
    }
    return null;
  }

  // Validates if the input is a number
  static String? validateIsDigit(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return "Only numeric values are allowed";
    }
    return null;
  }

  // Validates if the input is a valid URL
  static String? validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "URL is required";
    }
    if (!GetUtils.isURL(value)) {
      return "Provide a valid URL";
    }
    return null;
  }
}
