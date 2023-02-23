import 'dart:ui';

import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final color;
  final String text;
  final margin;

  double size;

  SmallText(
      {Key? key,
      required this.text,
      this.color = const Color.fromARGB(255, 207, 207, 207),
      this.size = 15,
      this.margin: EdgeInsets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'roboto',
        fontSize: size,
      ),
    );
  }
}
