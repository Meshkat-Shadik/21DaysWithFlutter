import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.route, this.title});
  final String route;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Center(child: Text(title, style: k_calculateButtonStyle)),
          color: k_bottomContainerColor,
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: k_bottomContainerHeight),
    );
  }
}
