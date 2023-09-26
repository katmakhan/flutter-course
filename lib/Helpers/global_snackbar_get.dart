import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalSnackBarGet {
  void showGetError(String head, String title) {
    Get.snackbar(
      head,
      title,
      snackPosition: SnackPosition.TOP,
      icon: const Icon(Icons.person, color: Colors.white),
      backgroundColor: Colors.red,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.black,
      duration: const Duration(seconds: 1),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  void showGetSucess(String head, String title) {
    Get.snackbar(
      head,
      title,
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.person, color: Colors.white),
      backgroundColor: Colors.green,
      borderRadius: 20,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 100),
      colorText: Colors.black,
      duration: const Duration(seconds: 1),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  void showGetSucess2(String head, String title, int duration) {
    Get.snackbar(
      head,
      title,
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.person, color: Colors.white),
      backgroundColor: Colors.green,
      borderRadius: 20,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 100),
      colorText: Colors.black,
      duration: Duration(seconds: duration),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
