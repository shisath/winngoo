import 'package:flutter/material.dart';

class WinngooBox extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderWidth;
  final double radius;
  final Color borderColor;
  final Color? fillColor;
  final Widget child;
  final BorderRadius? radiusOnly;

  const WinngooBox(
      {super.key,
      this.borderColor = Colors.transparent,
      this.height,
      this.width,
      this.radius = 0.0,
      this.fillColor,
      required this.child,
      this.borderWidth = 1.0,
      th,
      this.radiusOnly});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: fillColor,
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: radiusOnly ?? BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
