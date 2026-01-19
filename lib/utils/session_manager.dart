import 'package:flutter_login_token_authentication/constants/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  Future<void> saveSession(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstant.tokenKey, accessToken);
  }

  Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = await prefs.getString(AppConstant.tokenKey) ?? '';
    return accessToken;
  } 

  Future<void> removeAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstant.tokenKey);
  }
}