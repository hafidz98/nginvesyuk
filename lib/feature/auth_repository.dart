

import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  //final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  Future saveLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('login', true);
  }

  Future deleteLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('login', false);
  }

  Future<bool> readLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool login = prefs.getBool('login') ?? false;
    return login;
  }
}
