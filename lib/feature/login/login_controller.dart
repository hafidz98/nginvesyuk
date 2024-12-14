import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nginvesyuk/feature/auth_repository.dart';
import 'package:nginvesyuk/feature/home/home_screen.dart';
import 'package:nginvesyuk/feature/login/login_screen.dart';

import '../home/home_repository.dart';

class LoginController {
  late final AuthRepository _authRepository;
  late final HomeRepository _homeRepository;

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  LoginController(this._authRepository, this._homeRepository) {
    loadSavedCredentials();
    logout();
  }

  Future<void> loadSavedCredentials() async {
    var userData = await _homeRepository.fetchUser();
    userController.text = userData.username!;
    passController.text = userData.password!;
  }

  void dispose() {
    userController.dispose();
    passController.dispose();
  }

  Future<bool> login(String username, String password) async {
    var data = await _homeRepository.fetchUser();
    if (kDebugMode) {
      print(
          'Data JSON: ${data.username} ${data.password}\nData Input: $username $password');
    }
    if (data.username == username && data.password == password) {
      _authRepository.saveLogin();
      return true;
    }
    return false;
  }

  void logout() {
    _authRepository.deleteLogin();
  }

  Future checkLogin() async {
    bool isLogged = await _authRepository.readLogin();
    if (kDebugMode) {
      print('LoggedIn: $isLogged');
    }
    if (isLogged) {
      return HomeScreen.id;
    } else {
      return LoginScreen.id;
    }
  }
}
