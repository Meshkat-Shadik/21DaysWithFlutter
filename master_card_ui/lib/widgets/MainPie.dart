import 'dart:math';

import 'package:flutter/material.dart';
import 'package:master_card_ui/data.dart';

class MainPie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.0),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: customShadow,
          color: primaryColor,
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: CustomPaint(
                  child: Container(), foregroundPainter: PieChartPainter()),
            ),
            Center(
              child: Container(
                child: Center(
                    child: Text(
                  '\$1234',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: customShadow,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30;

    double total = 0;

    expenses.forEach((element) {
      total += element['amount'];
    });

    var startRadian = -pi / 2;
    for (int i = 0; i < expenses.length; i++) {
      var current = expenses[i];
      var sweepRadian = (current['amount'] / total) * 2 * pi;
      paint.color = pieColors[i];

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint);
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
