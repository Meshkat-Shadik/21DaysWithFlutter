import 'package:flutter/material.dart';
import 'package:page_route/screens/screen0.dart';
import 'package:page_route/screens/screen1.dart';
import 'package:page_route/screens/screen2.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {

   //normal routing
      case Screen0.pathId:
        return MaterialPageRoute(builder: (_) => Screen0());

   //argument based routing
      case Screen1.pathId:
        return MaterialPageRoute(builder: (_) => Screen1());
      case Screen2.pathId:
        return MaterialPageRoute(builder: (_) => Screen2(passedNameArg: args));

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
