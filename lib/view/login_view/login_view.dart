import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/constants/text_constants.dart';
import 'package:food_delivery_app/injections/locator.dart';
import 'package:food_delivery_app/services/auth_service.dart';
import 'package:food_delivery_app/view/forgot_password_view/forgot_password_view.dart';
import 'package:food_delivery_app/view/login_view/login_view_model.dart';
import 'package:food_delivery_app/view/onboarding_view/onboarding_view.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../core/extensions/app_color_extensions.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColorsExtensions>()!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: appColors.surface,
        body: ViewModelBuilder.reactive(
          viewModelBuilder: () => LoginViewModel(),
          onViewModelReady: (viewModel) => viewModel.init(),
          builder: (context, viewModel, child) {
            return Column(
              children: [
                Container(
                  height: 280.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: appColors.background,
                    borderRadius: BorderRadius.all(Radius.circular(32.r)),
                    boxShadow: [
                      BoxShadow(
                        color: appColors.blurColor,
                        spreadRadius: 1,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 90.h),
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 120.h,
                        ),
                      ),
                      const Spacer(),
                      TabBar(
                        indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 3.w, color: appColors.primary),
                          insets: EdgeInsets.symmetric(horizontal: 60.w),
                        ),
                        indicatorColor: appColors.primary,
                        dividerColor: appColors.onBackground,
                        unselectedLabelColor: appColors.textColor,
                        labelColor: appColors.primary,
                        tabs: [
                          Tab(text: TextConstants.login),
                          Tab(text: TextConstants.signUp),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _loginView(viewModel, appColors, false, () async {
                        await locator<AuthService>().signInWithEmail(
                            viewModel.mailController.text,
                            viewModel.passwordController.text);
                      }),
                      _loginView(viewModel, appColors, true, () async {
                        await locator<AuthService>().createAnAccount(
                            viewModel.nameController.text,
                            viewModel.newMailController.text,
                            viewModel.newPasswordController.text);
                      }),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _loginView(LoginViewModel viewModel, AppColorsExtensions appColors,
    bool isSignUp, void Function()? function) {
  return SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        if (isSignUp) ...[
          Text(
            TextConstants.name,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: appColors.textColor,
            ),
          ),
          TextFormField(
            controller: viewModel.nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return TextConstants.nameRequired;
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
        ],
        Text(
          TextConstants.emailAdress,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: appColors.textColor),
        ),
        TextFormField(
          controller:
              isSignUp ? viewModel.newMailController : viewModel.mailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return TextConstants.emailRequired;
            } else if (!value.contains('@') || !value.contains('.')) {
              return TextConstants.enterValidMail;
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        Text(
          TextConstants.password,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: appColors.textColor),
        ),
        TextFormField(
          controller: isSignUp
              ? viewModel.newPasswordController
              : viewModel.passwordController,
          obscureText:
              isSignUp ? viewModel.newObscureText : viewModel.obscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(isSignUp
                  ? (viewModel.newObscureText
                      ? Icons.visibility_off
                      : Icons.visibility)
                  : (viewModel.obscureText
                      ? Icons.visibility_off
                      : Icons.visibility)),
              onPressed: isSignUp
                  ? viewModel.toggleNewPasswordObscureText
                  : viewModel.toggleObscureText,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return TextConstants.passwordRequired;
            } else if (value.length < 6) {
              return TextConstants.atLeast6char;
            }
            return null;
          },
        ),
        if (!isSignUp)
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () => Get.offAll(const ForgotPasswordView()),
              child: Text(TextConstants.forgotPassword,
                  style: TextStyle(
                      color: appColors.primary, fontWeight: FontWeight.bold)),
            ),
          ),
        SizedBox(height: 40.h),
        ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(1.sw, 0.08.sh),
            backgroundColor: appColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
          ),
          child: Text(
            isSignUp ? TextConstants.signUp : TextConstants.login,
            style: TextStyle(color: appColors.onPrimary),
          ),
        ),
      ],
    ),
  );
}
