import 'package:flutter/material.dart';

class DecorationUtils {
  static ShapeBorder getCardRoundedBorder(double radius) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  static Widget clipTopWithRadius(Widget widget, double radius) {
    final Radius radiusValue = Radius.circular(radius);
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: radiusValue,
        topLeft: radiusValue,
      ),
      child: widget,
    );
  }

  static BoxDecoration getContainerDecoration(double radius, Color color) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color,
    );
  }
}
