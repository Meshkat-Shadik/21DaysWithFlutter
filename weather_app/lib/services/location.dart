import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double lattitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      lattitude = position.latitude;
      longitude = position.longitude;
    } catch (ex) {
      print(ex);
    }
  }
}
