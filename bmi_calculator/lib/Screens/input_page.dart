import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/Box.dart';
import '../components/BoxContent.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleBoxColor = k_inactiveBoxColor;
  Color femaleBoxColor = k_inactiveBoxColor;
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(elevation: 0, title: Center(child: Text('BMI CALCULATOR'))),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: Box(
                        customColor: selectedGender == Gender.male
                            ? k_activeBoxColor
                            : k_inactiveBoxColor,
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
                            ? k_activeBoxColor
                            : k_inactiveBoxColor,
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
              customColor: k_activeBoxColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: k_labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: k_numberTextStyle),
                        Text('cm', style: k_labelTextStyle)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: k_sliderInactiveColor,
                        thumbColor: k_sliderActiveColor,
                        overlayColor: k_sliderActiveColor.withOpacity(0.2),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25),
                      ),
                      child: Slider(
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                      ),
                    )
                  ]),
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: Box(
                  customColor: k_activeBoxColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: k_labelTextStyle),
                      Text(weight.toString(), style: k_numberTextStyle),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Box(
                  customColor: k_activeBoxColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: k_labelTextStyle),
                      Text(age.toString(), style: k_numberTextStyle),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )),
            BottomButton(
              route: '/result',
              title: 'CALCULATE',
            )
          ],
        ));
  }
}
