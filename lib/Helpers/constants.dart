// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertemplate/Colors/colors.dart';

class Constants {
  // Size for uplaod
  static const String MAX_IMAGE_SIZE_MESSAGE = "Image should be less than 1MB";
  static const double MAX_IMAGE_SIZE = 1024 * 1024;

  static const String MAX_PDF_SIZE_MESSAGE = "PDF should be less than 12MB";
  static const double MAX_PDF_SIZE = 48 * 1024 * 1024;

  // Colors
  static const primaryColor = Color(0xFF2697FF);
  static const secondaryColor = Color(0xFF2A2D3E);
  static const bgColor = Color(0xFF212332);

  // Padding
  static const defaultPadding = 16.0;
  static const double avatarRadius = 45;
  static const EdgeInsets recyclerpadding = EdgeInsets.all(16);

  // Text Styles
  static const TextStyle buttonTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.lightBlack,
  );

  static const TextStyle headingTextStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      color: AppColors.black,
      fontWeight: FontWeight.w700);

  static const introHeadingTextStyle = TextStyle(
      height: 1,
      letterSpacing: 1,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w800,
      fontSize: 40,
      color: AppColors.white);

  //Button Text Style
  static const alertButtonStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10,
      color: Color(0xFFc264fc),
      fontWeight: FontWeight.w400);

  // Button Container
  static Container alertButtonContainer(btntxt) => Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: const Color(0xfff6f3ff),
          borderRadius: BorderRadius.circular(5)),
      child: Text(btntxt, style: alertButtonStyle));

  // Linear Gradient
  static const LinearGradient mainlinearGradient = LinearGradient(
    begin: Alignment.center,
    end: Alignment.centerRight,
    colors: [
      AppColors.primaryColor,
      AppColors.primaryColorLight,
    ],
  );
}
