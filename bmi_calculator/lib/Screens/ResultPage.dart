import 'package:bmi_calculator/components/Box.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
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
                      Text('Overweight', style: k_resultTextStyle),
                      Text('26.7', style: k_resultNumberStyle),
                      Text('Lorem ipsumihasdsjadasldsf',
                          style: k_resultInfoStyle),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              )),
          BottomButton(
            route: '/',
            title: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
