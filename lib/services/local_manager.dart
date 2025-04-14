import 'package:food_delivery_app/core/enums/local_manager_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalManager {
  static final LocalManager _instance = LocalManager._();

  factory LocalManager() => _instance;

  LocalManager._();

  static SharedPreferences? _preferences;

  static Future<void> preferencesInit() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(LocalManagerKeys key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  Future<void> setBoolValue(LocalManagerKeys key, bool value) async {
    await _preferences?.setBool(key.toString(), value);
  }

  Future<void> setIntValue(LocalManagerKeys key, int value) async {
    await _preferences?.setInt(key.toString(), value);
  }

  String getStringValue(LocalManagerKeys key) =>
      _preferences?.getString(key.toString()) ?? '';

  bool getBoolValue(LocalManagerKeys key) =>
      _preferences?.getBool(key.toString()) ?? false;

  int getIntValue(LocalManagerKeys key) =>
      _preferences?.getInt(key.toString()) ?? -1;

  Future<void> setUserData(dynamic userData) async {
    await setBoolValue(LocalManagerKeys.isOnboardingDone, true);
    await setBoolValue(LocalManagerKeys.isLogin, true);
    await setStringValue(LocalManagerKeys.userId, userData.userId);
    await setStringValue(LocalManagerKeys.mail, userData.email);
    await setStringValue(LocalManagerKeys.name, userData.name);
    await setStringValue(
        LocalManagerKeys.createdAt, userData.createdAt.toIso8601String());
    await setStringValue(LocalManagerKeys.photoUrl, userData.photoUrl);
    await setBoolValue(LocalManagerKeys.locationPermissionShown, userData.locationPermissionShown);

  }
}
