import 'package:flutter/material.dart';
import 'package:my_music_ui/colors.dart';

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Controls(50, Icons.repeat),
          Controls(50, Icons.skip_previous),
          Controls(100, Icons.play_arrow),
          Controls(50, Icons.skip_next),
          Controls(50, Icons.shuffle),
        ],
      ),
    );
  }
}

class Controls extends StatelessWidget {
  double heightWidth;
  IconData icon;
  Controls(this.heightWidth, this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightWidth,
      width: heightWidth,
      decoration: BoxDecoration(
          shape: BoxShape.circle, boxShadow: customShadow, color: primaryColor),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: heightWidth == 100? darkPrimaryColor:Colors.grey,
                boxShadow: customShadow,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(icon,size: heightWidth==100?70:30,color:darkPrimaryColor,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
