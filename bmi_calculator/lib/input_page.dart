import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Box.dart';
import 'BoxContent.dart';

//constants//
const bottomContainerHeight = 80.0;
const activeBoxColor = Color(0xFF1D1E33);
const inactiveBoxColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleBoxColor = inactiveBoxColor;
  Color femaleBoxColor = inactiveBoxColor;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(elevation: 0, title: Center(child: Text('BMI CALCULATOR'))),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: Box(
                        customColor: selectedGender == Gender.male
                            ? activeBoxColor
                            : inactiveBoxColor,
                        cardChild: BoxContent(
                            customIcon: FontAwesomeIcons.mars, title: 'MALE'),
                        onTapWork: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        })),
                Expanded(
                    child: Box(
                        customColor: selectedGender == Gender.female
                            ? activeBoxColor
                            : inactiveBoxColor,
                        cardChild: BoxContent(
                            customIcon: FontAwesomeIcons.venus,
                            title: 'FEMALE'),
                        onTapWork: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        }))
              ],
            )),
            Expanded(
                child: Box(
              customColor: activeBoxColor,
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(child: Box(customColor: activeBoxColor)),
                Expanded(child: Box(customColor: activeBoxColor))
              ],
            )),
            Container(
                color: bottomContainerColor,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomContainerHeight)
          ],
        ));
  }
}
