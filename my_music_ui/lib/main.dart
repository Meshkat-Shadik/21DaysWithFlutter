import 'package:flutter/material.dart';
import 'package:my_music_ui/colors.dart';
import 'package:my_music_ui/playDetails.dart';
import 'package:my_music_ui/playerControls.dart';

import 'Albumart.dart';
import 'NavigationBar.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Circular'),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          NavigationBar(),
          SizedBox(height: 10),
          AlbumArt(),
          SizedBox(height: 50),
          PlayDetails(),
          SizedBox(height: 40),
          PlayerControls(),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}
