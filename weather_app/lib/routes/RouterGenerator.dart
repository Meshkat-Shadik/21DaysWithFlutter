import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/screens/location_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      case LoadingScreen.pathId:
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      case LocationScreen.pathId:
        return MaterialPageRoute(
            builder: (_) => LocationScreen(weatherData: args));
      case CityScreen.pathId:
        return MaterialPageRoute(builder: (_) => CityScreen());
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
