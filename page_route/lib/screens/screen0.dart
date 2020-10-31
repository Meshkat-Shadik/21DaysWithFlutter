import 'package:flutter/material.dart';
import 'package:page_route/screens/screen1.dart';
import 'package:page_route/screens/screen2.dart';

class Screen0 extends StatelessWidget {

  static const String pathId = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Screen1.pathId);
              },
              child: Text('Screen1'),
              color: Colors.orange[900],
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Screen2.pathId);
              },
              child: Text('Screen2'),
              color: Colors.lightBlue[300],
            )
          ],
        ),
      ),
    );
  }
}
