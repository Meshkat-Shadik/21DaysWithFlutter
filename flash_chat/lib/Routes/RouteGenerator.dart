import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final List args = settings.arguments;
    switch (settings.name) {
      case WelcomeScreen.pathId:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case LoginScreen.pathId:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RegistrationScreen.pathId:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('ERROR'), backgroundColor: Colors.red),
        body: Center(child: Text('ERROR')),
      );
    });
  }
}
