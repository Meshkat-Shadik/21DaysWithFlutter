import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const appId = '126a1bfa19c59da5f3fcb88d289614c5';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat, long;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.lattitude;
    long = location.longitude;
    //print(location.lattitude);
  // print(location.longitude);

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=${appId}&units=metric');

    dynamic decodeData = await networkHelper.getData();

    Navigator.pushNamed(context, '/locationScreen', arguments: decodeData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
