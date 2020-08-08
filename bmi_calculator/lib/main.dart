import 'package:bmi_calculator/Routes/RouteGenerator.dart';
import 'package:bmi_calculator/Screens/ResultPage.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'Screens/input_page.dart';

void main() {
  runApp(BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: myPrimaryColor,
          scaffoldBackgroundColor: myScaffoldBgColor,
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
      //    home: InputPage(),
      initialRoute: InputPage.id,
      onGenerateRoute: RouteGenerator.generateRoute,
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/result': (context) => ResultPage(),
      // },
    );
  }
}
