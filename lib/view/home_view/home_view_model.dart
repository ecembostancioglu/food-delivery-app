import 'package:flutter/material.dart';
import 'package:food_delivery_app/domain/models/restaurant_model.dart';
import 'package:food_delivery_app/services/food_service.dart';
import 'package:food_delivery_app/view/components/location_dialog.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../core/enums/local_manager_keys.dart';
import '../../domain/models/category_model.dart';
import '../../services/local_manager.dart';

class HomeViewModel extends BaseViewModel {

  final searchController = TextEditingController();
  FoodService foodService = FoodService();
  List<Restaurant> restaurants = [];
  List<Categories> categories = [];

  Future<void> init() async {
    setBusy(true);
    try{
      restaurants = await foodService.getAllFoods();
      categories = await foodService.getCategoryNames();
      notifyListeners();

    } catch(e) {
      debugPrint("$e");
    }
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
