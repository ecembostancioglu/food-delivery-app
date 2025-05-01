import '../../core/constants/app_constants.dart';

class Categories {
  final int id;
  final String name;
  final String imageUrl;

  Categories({required this.id, required this.name, required this.imageUrl});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      imageUrl: "${AppConstants.baseUrl}${json['imageUrl']}",
    );
  }
}