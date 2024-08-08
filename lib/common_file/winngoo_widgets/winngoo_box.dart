import 'package:flutter/material.dart';

class WinngooBox extends StatelessWidget {
  final double? height;
  final double width;
  final double borderWidth;
  final double radius;
  final Color borderColor;
  final Color boxColor;
  final Widget child;

  const WinngooBox({
    super.key,
    this.borderColor = Colors.transparent,
    this.height,
    this.width = 0.0,
    this.radius = 0.0,
    this.boxColor = Colors.transparent,
    required this.child,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: boxColor,
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
