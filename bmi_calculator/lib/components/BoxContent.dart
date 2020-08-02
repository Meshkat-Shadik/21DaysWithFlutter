import 'package:flutter/material.dart';

import '../constants.dart';

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
        SizedBox(height: 10),
        Text(title, style: k_labelTextStyle)
      ],
    );
  }
}
