import 'package:arb_tasks/core/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastManager {
  /// SUCCESS NOTIFICATION
  static showSuccess(String message, bool isSuccessfullState) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.rawSnackbar(
      message: message.tr,
      barBlur: 5,
      maxWidth: Get.width - 32,
      borderRadius: 10,
      duration: const Duration(seconds: 1),
      snackPosition: SnackPosition.TOP,
      backgroundColor:
          isSuccessfullState ? Colors.green.withOpacity(0.7) : Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    );
  }

  /// ERROR NOTIFICATION
  static showError(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.rawSnackbar(
      message: message,
      barBlur: 5,
      maxWidth: Get.width - 32,
      borderRadius: 10,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.red.withOpacity(0.7),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    );
  }
}
