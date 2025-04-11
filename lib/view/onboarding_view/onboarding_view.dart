import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/view/login_view/login_view.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'onboarding_view_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<OnboardingViewModel>.reactive(
        viewModelBuilder: () => OnboardingViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          final data = viewModel.onboardingTexts[viewModel.currentIndex];

          return Stack(
            children: [
              SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Image.asset(
                  'assets/images/onboarding_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
              BlurryContainer(
                blur: 10,
                elevation: 0,
                height: 1.sh,
                width: 1.sw,
                color: Colors.black.withOpacity(0.2),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 220.h),
                    height: 0.5.sh,
                    width: 0.9.sw,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(254, 140, 0, 0.9),
                      borderRadius: BorderRadius.all(Radius.circular(60.r)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 100.h,
                              child: Text(
                                data['title']!,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            SizedBox(
                              height: 100.h,
                              child: Text(
                                data['subtitle']!,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(viewModel.count, (index) {
                            final isActive = index == viewModel.currentIndex;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              width: isActive ? 20.w : 10.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.offAll(LoginView());
                                },
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                )),
                            TextButton(
                                onPressed: () {
                                  if (viewModel.currentIndex <
                                      viewModel.count - 1) {
                                    viewModel.currentIndex++;
                                    viewModel
                                        .onPageChanged(viewModel.currentIndex);
                                  }
                                },
                                child: Text('Next',
                                    style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold)))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
