import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Tile extends StatelessWidget {
  Tile({this.title, this.subtitle, required this.leading});

  String? title;
  String? subtitle;
  Widget leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        leading,
        Gap(10),
        RichText(
          text: TextSpan(
            text: "${title}\n",
            style: TextStyle(color: Colors.white),
            children: [
              TextSpan(
                text: subtitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
