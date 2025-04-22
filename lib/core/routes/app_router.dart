import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/enums/local_manager_keys.dart';
import 'package:food_delivery_app/services/local_manager.dart';
import 'package:food_delivery_app/view/login_view/login_view.dart';
import 'package:food_delivery_app/view/onboarding_view/onboarding_view.dart';

import '../../view/home_view/home_view.dart';

bool isLogin = LocalManager().getBoolValue(LocalManagerKeys.isLogin);
String initialRoute = isLogin == true ? '/login' : '/';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    bool isOnboardingDone =
        LocalManager().getBoolValue(LocalManagerKeys.isOnboardingDone);
    switch (settings.name) {
      case '/':
        if (!isOnboardingDone) {
          return MaterialPageRoute(
              builder: (context) => const OnboardingView());
        } else{
          return MaterialPageRoute(
              builder: (context) => const LoginView());
        }

      case '/login':
        if (!isLogin) {
          return MaterialPageRoute(
              builder: (context) => const LoginView());
        } else {
          return MaterialPageRoute(builder: (context) => const HomeView());
        }
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('No Page'),
                  ),
                ));
    }
  }
}
