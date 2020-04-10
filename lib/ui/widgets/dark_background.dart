import 'package:flutter/material.dart';

class DarkBackground extends StatelessWidget {
  Widget child;

  DarkBackground({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xff4d5775),
            Color(0xff1f283c),
          ],
          center: Alignment(1, -1),
          radius: 0.5,
          focalRadius: 5,
          focal: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
