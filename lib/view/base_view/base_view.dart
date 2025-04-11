import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/routes/app_router.dart';
import 'package:get/route_manager.dart';
import '../onboarding_view/onboarding_view.dart';

class BaseView extends StatelessWidget {
  
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360 , 690), 
      useInheritedMediaQuery: true,
      minTextAdapt: true, 
      splitScreenMode: true, 
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          themeMode: ThemeMode.system,
          initialRoute: initialRoute,
          onGenerateRoute: AppRouter.generateRoute,
      );
      },
    );
  }
}