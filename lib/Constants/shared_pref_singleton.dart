

import 'package:shared_preferences/shared_preferences.dart';


enum SharedPrefKeys {
  themeNumber,
}


class SharedPrefSingleton {
  static SharedPrefSingleton sharedInstance = SharedPrefSingleton();

  late SharedPreferences _preferences;

  Future<void> init() async{
    _preferences = await SharedPreferences.getInstance();
  }

 String? getString(String key) {
   return _preferences.getString(key);
  }

  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  setString(String key, String value){
    _preferences.setString(key, value);
  }
  setInt(String key, int value){
    _preferences.setInt(key, value);
  }


}