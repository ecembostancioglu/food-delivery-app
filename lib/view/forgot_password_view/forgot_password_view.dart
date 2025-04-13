import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/theme/app_colors.dart';
import 'package:food_delivery_app/view/forgot_password_view/forgot_password_view_model.dart';
import 'package:food_delivery_app/view/login_view/login_view.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../core/constants/text_constants.dart';
import '../../core/extensions/app_color_extensions.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColorsExtensions>()!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.offAll(const LoginView(),transition: Transition.noTransition),
            icon: Icon(Icons.chevron_left, size: 32.sp)),
      ),
      body: ViewModelBuilder.reactive(
        viewModelBuilder: () => ForgotPasswordViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: SizedBox(
                height: 1.sh,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot password?',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30.sp,
                          color: appColors.textColor),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Enter your email address and we\'ll send you confirmation code to reset your password',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.grey.grey500),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Email Address',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: appColors.textColor),
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: viewModel.mailController,
                      decoration: const InputDecoration(
                          hintText: 'Enter your email address'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstants.enterValidMail;
                        }
                        return null;
                      },
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.sendPasswordResetEmail(
                            viewModel.mailController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(1.sw, 0.08.sh),
                        backgroundColor: appColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(color: appColors.onPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
