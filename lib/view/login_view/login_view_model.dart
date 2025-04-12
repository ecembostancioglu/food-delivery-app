import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel{
  Future<void> init()async{}

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newMailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TabController? tabController;
  bool obscureText = true;

void toggleObscureText() {
  obscureText = !obscureText;
  notifyListeners();
}
}