import 'package:flash_chat/components/RoundedCustomButton.dart';
import 'package:flash_chat/components/RoundedCustomTextField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String pathId = '/loginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Hero(
                tag: 'logo',
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedCustomTextField(
              borderColor: Colors.lightBlueAccent,
              hint: 'Enter your email address here',
              pressChange: (value) {},
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedCustomTextField(
              borderColor: Colors.lightBlueAccent,
              hint: 'Enter your password here',
              pressChange: (value) {},
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedCustomButton(
              myColor: Colors.lightBlueAccent,
              press: () {},
              title: 'Log In',
            )
          ],
        ),
      ),
    );
  }
}
