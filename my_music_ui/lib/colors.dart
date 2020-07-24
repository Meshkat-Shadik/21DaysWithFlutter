import 'package:flutter/material.dart';

Color primaryColor = Color(0xffedd3cb);
Color darkPrimaryColor = Color(0xff6f3d2e);

List<BoxShadow> customShadow = [
  BoxShadow(
      color: darkPrimaryColor.withOpacity(0.5),
      spreadRadius: 3,
      offset: Offset(5, 10),
      blurRadius: 10),
  BoxShadow(
      color: Colors.white,
      spreadRadius: -2,
      offset: Offset(-3, -4),
      blurRadius: 20)
];

List<BoxShadow> customShadow2 = [
  BoxShadow(
      color: darkPrimaryColor,
      spreadRadius: 3,
      offset: Offset(2, 4),
      blurRadius: 10),
  BoxShadow(
      color: Colors.white,
      spreadRadius: -2,
      offset: Offset(-3, -4),
      blurRadius: 20)
];

List<BoxShadow> customShadow3 = [
  BoxShadow(
      color: darkPrimaryColor,
      spreadRadius: 3,
      offset: Offset(20, 8),
      blurRadius: 25),
  BoxShadow(
      color: Colors.white,
      spreadRadius: -2,
      offset: Offset(-3, -4),
      blurRadius: 20)
];
