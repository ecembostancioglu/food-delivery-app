import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/constants/app_constants.dart';
import 'package:food_delivery_app/domain/models/restaurant_model.dart';

class FoodService {
  Dio dio = Dio();
  String url = AppConstants.baseUrl;

Future<List<String>> getCategoryNames()async{
  final response = await dio.get("${AppConstants.baseUrl}${AppConstants.restaurants}");
  if (response.statusCode == 200) {
      final raw = response.data;
      final Map<String, dynamic> data =
          raw is String ? jsonDecode(raw) : raw as Map<String, dynamic>;

      return data.keys.toList();
    } else {
      throw Exception('Failed to load categories');
    }
}

Future<List<Restaurant>> getAllFoods() async {
  final response = await dio.get("${AppConstants.baseUrl}${AppConstants.restaurants}");
  log(response.data.toString());

  if (response.statusCode == 200) {
    final raw = response.data;
    final Map<String, dynamic> data =
        raw is String ? jsonDecode(raw) : raw as Map<String, dynamic>;

    final List<Restaurant> allRestaurants = [];

    data.forEach((category, items) {
      for (var item in items) {
        allRestaurants.add(Restaurant.fromJson(item));
      }
    });

    return allRestaurants;
  } else {
    throw Exception('Failed to load restaurants');
  }
}

}