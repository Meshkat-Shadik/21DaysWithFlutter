import 'package:flutter/material.dart';
import 'package:page_route/screens/screen1.dart';

class Screen2 extends StatelessWidget {
  static const String pathId = '/screen2';
  final dynamic passedNameArg;
  Screen2({this.passedNameArg});
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
              color: Colors.amber[700],
            ),
            SizedBox(height: 10),
            Text(passedNameArg)
          ],
        ),
      ),
    );
  }
}
