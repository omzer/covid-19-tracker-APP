import 'package:flutter/material.dart';

class DecorationUtils {
  static DecorationUtils _decorationUtils;

  static DecorationUtils getInstance() {
    return _decorationUtils ?? (_decorationUtils = DecorationUtils());
  }

  ShapeBorder getCardRoundedBorder(double radius) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  Widget clipTopWithRadius(Widget widget, double radius) {
    final Radius radiusValue = Radius.circular(radius);
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: radiusValue,
        topLeft: radiusValue,
      ),
      child: widget,
    );
  }

  BoxDecoration getContainerDecoration(double radius, Color color) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color,
    );
  }

  BoxDecoration getContainerBorder(Color color) {
    return BoxDecoration(border: Border.all(color: Colors.white));
  }
}
