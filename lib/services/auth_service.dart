import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/injections/locator.dart';
import 'package:food_delivery_app/services/firebase_service.dart';
import 'package:food_delivery_app/utils/theme/app_colors.dart';
import 'package:food_delivery_app/view/home_view/home_view.dart';
import 'package:get/get.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> createAnAccount(
      String name, String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;

      locator<FirebaseService>().atFirebaseData(user!.uid, email, name);

      Get.snackbar('Congratulations!', 'Your account created successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.green);
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(const HomeView());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error!', 'The password provided is too weak.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.red);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error!', 'An account already exists with that email.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.red);
      } else {
        Get.snackbar('Error', e.message ?? 'Unknown error occurred',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.red);
      }
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar('Successful!', 'You are logging in!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.green);
      final user = credential.user;

      locator<FirebaseService>().getUserFirebaseData(user!.uid);

      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(const HomeView());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        Get.snackbar('Error!', 'Invalid login credentials.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.red);
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error!', 'Wrong password.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.red);
      } else {
        Get.snackbar('Error', e.message ?? 'Unknown error occurred',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.red);
      }
    }
  }
}
