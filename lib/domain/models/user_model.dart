import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String userId;
  final String name;
  final String email;
  final DateTime createdAt;
  final String photoUrl;
  final bool locationPermissionShown;

  UserModel(
      {required this.userId,
      required this.name,
      required this.email,
      required this.createdAt,
      required this.photoUrl,
      required this.locationPermissionShown});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime(2000),
      photoUrl: json['photoUrl'] ?? '',
      locationPermissionShown: json['locationPermissionShown'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId' : userId,
      'email': email,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'photoUrl': photoUrl,
      'locationPermissionShown' : locationPermissionShown,
    };
  }

factory UserModel.fromFirebaseUser(User user, Map<String,dynamic> data){
  return UserModel(
    userId: user.uid,
    name: user.displayName ?? data['name'] ?? '', 
    email: user.email ?? data['email'] ?? '',
    photoUrl: data['photoUrl'] ?? '',
    createdAt: DateTime.tryParse(data['createdAt'] ?? '') ?? DateTime.now(),
    locationPermissionShown : data['locationPermissionShown'] ?? false
    );
}

}
