import 'package:flutter/material.dart';
import 'package:life_time_app/constants.dart';

class IconCinsiyet extends StatelessWidget {
  String? cinsiyet;
  IconData? icon;

  IconCinsiyet({this.cinsiyet, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon!,
          color: Colors.black54,
          size: 40,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet!,
          style: emreStyle),
      ],
    );
  }
}