import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/core/enums/local_manager_keys.dart';
import 'package:food_delivery_app/services/local_manager.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../domain/models/user_model.dart';

class FirebaseService {
  final firebaseFirestore = FirebaseFirestore.instance;
  Rx<UserModel?> userModel = Rx<UserModel?>(null);
  Future<void> getUserFirebaseData(String id) async {
    await firebaseFirestore
        .collection('users')
        .doc(id)
        .get()
        .then((DocumentSnapshot doc) async {
      Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;
      if (doc.exists) {
        userModel.value = UserModel.fromJson(docData);
        userModel.value = UserModel.fromJson(docData);
        await LocalManager().setUserData(userModel.value);
      }
    });
  }

  Future<void> atFirebaseData(
      String userId, String email, String name) async {
    UserModel newUser = UserModel(
        userId: userId,
        name: name,
        email: email,
        createdAt: DateTime.now(),
        photoUrl: '',
        locationPermissionShown: false);

    await firebaseFirestore
        .collection('users')
        .doc(userId)
        .set(newUser.toJson(), SetOptions(merge: true));
  }

  Future<void> locationPermission()async{
    await Permission.location.request();
    await FirebaseFirestore.instance.collection('users').doc(userModel.value!.userId)
    .set({'locationPermissionShown': true}, SetOptions(merge: true));

    await LocalManager().setBoolValue(LocalManagerKeys.locationPermissionShown, true);
  }
}
