# 🍔 Food Delivery App

A modern food delivery application built with Flutter. This app uses `dio` for HTTP requests, integrates with Firebase, and leverages MVVM architecture using `stacked` and `get_it`.

## 🚀 Features

- Firebase Authentication and Firestore
- Real-time food and restaurant listing
- Category-based filtering
- Persistent local storage with SharedPreferences
- Responsive UI with `flutter_screenutil`
- Blurry background effects and smooth page transitions
- MVVM architecture using `stacked` and dependency injection via `injectable`

## 🔗 API

This project fetches data from a custom REST API.

## 🧰 Packages Used

| Package | Description |
|--------|-------------|
| [get](https://pub.dev/packages/get) | State management and routing |
| [get_it](https://pub.dev/packages/get_it) | Dependency injection |
| [stacked](https://pub.dev/packages/stacked) | MVVM architecture |
| [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) | Responsive design support |
| [firebase_core](https://pub.dev/packages/firebase_core) | Core Firebase functionality |
| [firebase_auth](https://pub.dev/packages/firebase_auth) | User authentication |
| [cloud_firestore](https://pub.dev/packages/cloud_firestore) | Cloud Firestore database |
| [shared_preferences](https://pub.dev/packages/shared_preferences) | Local storage |
| [dio](https://pub.dev/packages/dio) | Network requests |
| [injectable](https://pub.dev/packages/injectable) | Dependency injection code generation |
| [permission_handler](https://pub.dev/packages/permission_handler) | Runtime permission handling |
| [blurrycontainer](https://pub.dev/packages/blurrycontainer) | Blurred container effect |
| [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator) | Page indicators for onboarding, sliders |
| [provider](https://pub.dev/packages/provider) | State management (optional use) |

## 🛠 Architecture

- **MVVM** with `stacked`
- **Service Locator** pattern via `get_it` & `injectable`
- **Firebase-backed** backend
- Organized folder structure with separation of concerns

## 📱 Screenshots

<p float="left">
  <img src="https://github.com/user-attachments/assets/a314d258-2875-4bf8-8fb5-bae02587e58d" width="250" alt="Onboarding Screen"/>
  <img src="https://github.com/user-attachments/assets/0d9e48b2-a48c-4407-845c-14e18d84f3fd" width="250" alt="Login Screen"/>
  <img src="https://github.com/user-attachments/assets/94907571-7b50-451e-90dd-99817eefc58c" width="250" alt="Home Screen"/>
</p>

## 📝 To Do

- [ ] User Profile & Settings
- [ ] Order Tracking
- [ ] Payment Integration
- [ ] Review & Rating System

## 📦 Installation

```bash
git clone https://github.com/your-username/food_delivery_app.git
cd food_delivery_app
flutter pub get
flutter run
