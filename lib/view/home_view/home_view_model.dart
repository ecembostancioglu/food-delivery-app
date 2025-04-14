import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/components/location_dialog.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../core/enums/local_manager_keys.dart';
import '../../services/local_manager.dart';

class HomeViewModel extends BaseViewModel {

  final searchController = TextEditingController();

  Future<void> init() async {
    bool isShown =
        LocalManager().getBoolValue(LocalManagerKeys.locationPermissionShown);

    if (!isShown) {
      await Future.delayed(Duration.zero);

      Get.dialog(
        const LocationPermissionDialog(),
        barrierDismissible: false,
      );
    }
  }
}
