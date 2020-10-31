import 'package:flutter/material.dart';
import 'package:page_route/route/RouteGenerator.dart';
import 'package:page_route/screens/screen0.dart';
import 'package:page_route/screens/screen1.dart';
import 'package:page_route/screens/screen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page route',
   //OLD METHOD::
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => Screen0(),
      //   '/screen1': (context) => Screen1(),
      //   '/screen2': (context) => Screen2(),
      // },

  //NEW METHOD::  (RESO CODER + MODIFIED)
      initialRoute: Screen0.pathId,
      onGenerateRoute: RouteGenerator.generateRoute,

    );
  }
}
