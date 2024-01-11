import 'package:get_storage/get_storage.dart';

class SharedPreference {
  final _sharedPref = GetStorage();
  static const _kThemeKey = 'theme_key';
  static const _kTokenKey = 'bearer_token';

  String? getTheme() {
    return _sharedPref.read(_kThemeKey);
  }

  Future<void> setTheme(String value) async {
    _sharedPref.write(_kThemeKey, value);
  }

  String? getToken() {
    return _sharedPref.read(_kTokenKey);
  }

  Future<void> setToken({required String token}) async {
    _sharedPref.write(_kTokenKey, token);
  }

  Future<void> removeSession() async {
    _sharedPref.remove(_kTokenKey);
  }
}
