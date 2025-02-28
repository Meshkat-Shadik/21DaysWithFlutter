import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/RoundedCustomButton.dart';
import 'package:flash_chat/components/RoundedCustomTextField.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String pathId = '/registrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
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
              borderColor: Colors.blueAccent,
              hint: 'Enter your email address here',
              pressChange: (value) {
                email = value;
              },
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedCustomTextField(
              hint: 'Enter your password here',
              borderColor: Colors.blueAccent,
              pressChange: (value) {
                password = value;
              },
              hidden: true,
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedCustomButton(
              title: 'Register',
              myColor: Colors.blueAccent,
              press: () async{
                try{
               final newUser = await _auth.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                if(newUser != null)
                {
                  Navigator.pushNamed(context, ChatScreen.pathId);
                }
                }
                catch(ex)
                {
                  print(ex);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
