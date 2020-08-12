import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class RoundedCustomTextField extends StatelessWidget {
  RoundedCustomTextField({this.hint, this.borderColor, this.pressChange});
  final String hint;
  final Color borderColor;
  final Function pressChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: pressChange,
        decoration: kTextFieldDecoration.copyWith(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ));
  }
}
