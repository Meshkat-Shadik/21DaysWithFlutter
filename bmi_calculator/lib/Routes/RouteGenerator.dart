import 'package:bmi_calculator/Screens/ResultPage.dart';
import 'package:bmi_calculator/Screens/input_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final List args = settings.arguments;
    switch (settings.name) {
      case InputPage.id:
        return MaterialPageRoute(builder: (_) => InputPage());
      case ResultPage.id:
        return MaterialPageRoute(
            builder: (_) => ResultPage(
                  numberResult: args[0],
                  textResult: args[1],
                  information: args[2],
                ));
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
