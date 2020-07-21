import 'package:flutter/material.dart';
import 'package:master_card_ui/data.dart';

import 'MainPie.dart';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Expenses',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  children: expenses
                      .map((e) => Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      pieColors[expenses.indexOf(e)],
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  e['name'],
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            Expanded(flex: 6, child: MainPie())
          ],
        ),
      ],
    );
  }
}
