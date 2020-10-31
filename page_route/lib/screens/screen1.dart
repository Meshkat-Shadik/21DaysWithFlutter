import 'package:flutter/material.dart';
import 'package:page_route/screens/screen2.dart';

class Screen1 extends StatefulWidget {
  static const String pathId = '/screen1';

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController _nameTextEditingController = TextEditingController();
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nameTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Input anything that you want to pass in Screen2",
                  labelStyle: TextStyle(fontSize: 14),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  name = _nameTextEditingController.text;
                });
                Navigator.pushNamed(context, Screen2.pathId, arguments: name);
              },
              child: Text('Send to Screen2'),
              color: Colors.purple[300],
            )
          ],
        ),
      ),
    );
  }
}
