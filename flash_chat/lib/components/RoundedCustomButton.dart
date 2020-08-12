import 'package:flutter/material.dart';

class RoundedCustomButton extends StatelessWidget {
  RoundedCustomButton({this.title, this.myColor, this.press});
  final String title;
  final Function press;
  final Color myColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: myColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: press,
          minWidth: 200.0,
          height: 42.0,
          child: Text(title),
        ),
      ),
    );
  }
}
