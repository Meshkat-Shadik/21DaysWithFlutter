import 'package:flutter/material.dart';
import 'package:master_card_ui/data.dart';
import 'package:master_card_ui/widgets/CardSection.dart';
import 'package:master_card_ui/widgets/PieChart.dart';
import 'package:master_card_ui/widgets/WalletHeader.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Circular'),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            child: WalletHeader(),
          ),
          Expanded(child: CardSection()),
          Expanded(child: PieChart()),
        ],
      ),
    );
  }
}
