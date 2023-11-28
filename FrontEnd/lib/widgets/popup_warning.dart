import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PopupWarning {
  static void taskWarning(String title, String message,
      {Color color = Colors.redAccent}) {
    Get.snackbar(
      title,
      message,
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
      backgroundColor: Colors.blueAccent.withOpacity(0.3),
      colorText: color,
      icon: Icon(
        title == "Done" ? Icons.check : Icons.error,
        color: color,
        size: 30,
      ),
      margin: const EdgeInsets.only(
        top: 10,
      ),
      maxWidth: 350,
    );
  }
}
