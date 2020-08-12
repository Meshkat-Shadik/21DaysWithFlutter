import 'package:flash_chat/components/RoundedCustomButton.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String pathId = '/';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    // animation.addStatusListener((status) {
    //   if(status == AnimationStatus.completed){
    //     controller.reverse(from: 1.0);
    //   }
    //   else if(status == AnimationStatus.dismissed)
    //   {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value, //Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset('images/logo.png',
                        width: 60 //animation.value*100,
                        ),
                  ),
                  height: 60.0,
                ),
                TypewriterAnimatedTextKit(
                    // '${(animation.value * 100).toStringAsFixed(0)}%',
                    speed: Duration(milliseconds: 300),
                    text: ["Flash Chat", "Flash Chat"],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedCustomButton(
              title: "Log In",
              myColor: Colors.lightBlueAccent,
              press: () {
                Navigator.pushNamed(context, LoginScreen.pathId);
              },
            ),
            RoundedCustomButton(
              title: "Register",
              myColor: Colors.blueAccent,
              press: () {
                Navigator.pushNamed(context, RegistrationScreen.pathId);
              },
            )
          ],
        ),
      ),
    );
  }
}
