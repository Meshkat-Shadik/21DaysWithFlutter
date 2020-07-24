import 'package:flutter/material.dart';
import 'package:my_music_ui/colors.dart';

class AlbumArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Album();
        },
        itemCount: 3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class Album extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 260,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      padding: EdgeInsets.all(10),
      child: Container(
        child: ClipRRect(
          child: Image.asset(
            'images/artcell.jpg',
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          //  boxShadow: customShadow2,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: customShadow3,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
