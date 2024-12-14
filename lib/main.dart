import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nginvesyuk/feature/auth_repository.dart';
import 'package:nginvesyuk/feature/home/home_repository.dart';
import 'package:nginvesyuk/feature/home/home_screen.dart';
import 'package:nginvesyuk/feature/login/login_controller.dart';
import 'package:nginvesyuk/feature/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NginvesYuk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final LoginController _controller =
      LoginController(AuthRepository(), HomeRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.checkLogin(),
      builder: (context, snapshot) {
        _controller.logout();
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (kDebugMode) {
            print('ScreenData: ${snapshot.data}');
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: snapshot.data,
            routes: {
              LoginScreen.id: (context) => const LoginScreen(),
              HomeScreen.id: (context) => const HomeScreen(),
            },
          );
        }
      },
    );
  }
}
