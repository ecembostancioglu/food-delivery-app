import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../utils/theme/app_colors.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  Future<void> init() async {}

  final mailController = TextEditingController();

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar('Send', 'Please check your email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.grey.grey500);
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.grey.grey500);
    }
  }
}
