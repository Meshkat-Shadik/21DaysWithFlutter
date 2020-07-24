import 'package:flutter/material.dart';

import 'colors.dart';

class PlayDetails extends StatefulWidget {
  @override
  _PlayDetailsState createState() => _PlayDetailsState();
}

class _PlayDetailsState extends State<PlayDetails> {
  double sliderValue = 1.25;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Shongshoy',
          style: TextStyle(
              fontSize: 40,
              color: darkPrimaryColor,
              fontWeight: FontWeight.w400),
        ),
        Text(
          'Artcell',
          style: TextStyle(
              fontSize: 22,
              color: darkPrimaryColor,
              fontWeight: FontWeight.w300),
        ),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 5,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
          ),
          child: Slider(
            activeColor: darkPrimaryColor,
            inactiveColor: darkPrimaryColor.withOpacity(0.3),
            value: sliderValue,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
            min: 0,
            max: 4.44,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("1:25", style: TextStyle(color: darkPrimaryColor)),
              Text("4:44", style: TextStyle(color: darkPrimaryColor))
            ],
          ),
        ),
      ],
    );
  }
}
