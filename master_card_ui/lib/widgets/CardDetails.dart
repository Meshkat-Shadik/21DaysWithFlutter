import 'package:flutter/material.dart';
import 'package:master_card_ui/data.dart';

class CardDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/mastercardlogo.png',
              width: 250,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              height: 50,
              width: 70,
              child: Image.asset('assets/sim.png',fit: BoxFit.fill,),
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: customShadow,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '**** **** **** 2058',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  'PLATINUM CARD',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
