import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class RoundedCustomTextField extends StatelessWidget {
  RoundedCustomTextField({this.hint, this.borderColor, this.pressChange,this.hidden,this.keyBoardType});
  final String hint;
  final Color borderColor;
  final Function pressChange;
  final bool hidden;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: keyBoardType,
        obscureText: hidden==true?true:false,
        textAlign: TextAlign.center ,
        onChanged: pressChange,
        style: TextStyle(color: Colors.black),
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
