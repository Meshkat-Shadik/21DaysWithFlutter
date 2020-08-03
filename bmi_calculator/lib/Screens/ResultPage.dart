import 'package:bmi_calculator/components/Box.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String textResult;
  final String numberResult;
  final String information;

  ResultPage({this.textResult, this.numberResult, this.information});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      backgroundColor: myScaffoldBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 40),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: k_resultTitleStyle),
            ),
          ),
          Expanded(
              flex: 7,
              child: Container(
                child: Box(
                  customColor: k_activeBoxColor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(textResult, style: k_resultTextStyle),
                      Text(numberResult, style: k_resultNumberStyle),
                      Text(information, style: k_resultInfoStyle),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              )),
          BottomButton(
            title: 'RE-CALCULATE',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
