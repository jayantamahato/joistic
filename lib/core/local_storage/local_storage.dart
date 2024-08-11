import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future clear() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  static Future setToken({required String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', token);
  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token') ?? '';
    return token;
  }

  static Future setAccessToken({required String accessToken}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('accessToken', accessToken);
  }

  static Future<String> getAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accessToken = preferences.getString('accessToken') ?? '';
    return accessToken;
  }
}
