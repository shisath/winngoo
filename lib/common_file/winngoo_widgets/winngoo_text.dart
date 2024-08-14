import 'package:flutter/material.dart';

class WinngooText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color color;
  final TextAlign? align;

  WinngooText({
    Key? key,
    required this.text,
    this.fontSize = 16.00,
    this.weight = FontWeight.normal,
    this.color = Colors.black,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.justify,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
