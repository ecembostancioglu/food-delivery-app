import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/routes/app_router.dart';
import 'package:food_delivery_app/utils/theme/app_theme.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import '../../utils/theme/theme_data.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final appTheme = context.watch<AppTheme>();
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.light,
          darkTheme: AppThemeData.dark,
          themeMode: appTheme.themeMode,
          initialRoute: initialRoute,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
