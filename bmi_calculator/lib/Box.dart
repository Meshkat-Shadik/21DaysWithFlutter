import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  Box({this.customColor, this.cardChild, this.onTapWork});
  final Color customColor;
  final Widget cardChild;
  final Function onTapWork;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapWork,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: customColor, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
