import 'package:flutter/material.dart';

class BoxContent extends StatelessWidget {
  final IconData customIcon;
  final String title;
  BoxContent({this.customIcon, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          customIcon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(height: 15),
        Text(title, style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)))
      ],
    );
  }
}
