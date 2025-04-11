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

  int getIntValur(LocalManagerKeys key) => 
  _preferences?.getInt(key.toString()) ?? -1;
}
