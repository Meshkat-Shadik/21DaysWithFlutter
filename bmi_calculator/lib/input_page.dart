import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//constants//
const bottomContainerHeight = 80.0;
const activeBoxColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  customColor: activeBoxColor,
                  cardChild: BoxContent(
                    customIcon: FontAwesomeIcons.mars,
                    title: 'MALE',
                  ),
                )),
                Expanded(
                    child: Box(
                  customColor: activeBoxColor,
                  cardChild: BoxContent(
                    customIcon: FontAwesomeIcons.venus,
                    title: 'FEMALE',
                  ),
                ))
              ],
            )),
            Expanded(
                child: Box(
              customColor: activeBoxColor,
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: Box(
                  customColor: activeBoxColor,
                )),
                Expanded(
                    child: Box(
                  customColor: activeBoxColor,
                ))
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}

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

class Box extends StatelessWidget {
  Box({this.customColor, this.cardChild});
  final Color customColor;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: customColor, borderRadius: BorderRadius.circular(10)),
    );
  }
}
