import 'package:shared_preferences/shared_preferences.dart';

class TokenSharePrefences {
  static Future<void> saveToken(String tokan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", tokan);
  }

  static Future<String?> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loadToken = prefs.getString("token");
    var loadedTokens = loadToken;
    return loadedTokens;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
