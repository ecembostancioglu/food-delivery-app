import 'package:food_delivery_app/core/constants/app_constants.dart';

class Restaurant {
  final int id;
  final String name;
  final double rating;
  final String imageUrl;

  Restaurant({
    required this.id,
    required this.name,
    required this.rating,
    required this.imageUrl,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      rating: (json['rating'] as num).toDouble(),
      imageUrl: "${AppConstants.baseUrl}${json['imageUrl']}",
    );
  }
}
