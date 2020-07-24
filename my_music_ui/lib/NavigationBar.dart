import 'package:flutter/material.dart';
import 'package:my_music_ui/colors.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavbarItem(Icons.arrow_back_ios),
          Text(
            'Playing Now',
            style: TextStyle(
                color: darkPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          NavbarItem(Icons.list),
        ],
      ),
    );
  }
}

class NavbarItem extends StatelessWidget {
  final IconData icon;

  NavbarItem(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: customShadow),
      child: Icon(icon),
    );
  }
}
