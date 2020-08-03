import 'package:bmi_calculator/Calculation.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.title, this.onPressed});
  final Function onPressed;
  final String title;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
