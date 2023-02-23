import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  final color;
  final String text;
  final margin;
  final padding;
  final crossAxisAlignment;

  double size;
  TextOverflow overflow;
  BigText(
      {Key? key,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.size = 20,
      this.overflow = TextOverflow.ellipsis,
      this.margin = EdgeInsets,
      this.padding = EdgeInsets,
      this.crossAxisAlignment = CrossAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'roboto',
        fontSize: size,
      ),
    );
  }
}
