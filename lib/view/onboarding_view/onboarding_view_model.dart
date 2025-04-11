import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardingViewModel extends BaseViewModel {

  final PageController pageController = PageController();
  int currentIndex = 0;

  List<Map<String, String>> onboardingTexts = [
    {
      "title": "We serve unforgettable flavors.",
      "subtitle": "All your favorite spots and their signature dishes — hot, fresh, and ready when you are!"
    },
    {
      "title": "Crave it. Tap it. Taste it.",
      "subtitle": "From sushi to pizza, discover the city's best in just a few taps."
    },
    {
      "title": "Delicious moments, delivered fast.",
      "subtitle": "Sit back and relax. We’ll bring your cravings to your door in no time."
    }
  ];

  int get count => onboardingTexts.length;

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void init() {
    currentIndex = 0;
    notifyListeners();
  }

}
