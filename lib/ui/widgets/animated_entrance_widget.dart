import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';

class AnimatedEntranceWidget extends StatefulWidget {
  Widget child;
  double offsetStart, offsetEnd;

  AnimatedEntranceWidget({this.child, this.offsetStart, this.offsetEnd});

  @override
  _AnimatedEntranceWidgetState createState() => _AnimatedEntranceWidgetState();
}

class _AnimatedEntranceWidgetState extends State<AnimatedEntranceWidget> {
  @override
  Widget build(BuildContext context) {
    EzAnimation animation = EzAnimation(
      0.0,
      1.0,
      Duration(milliseconds: 250),
      context: context,
      curve: Curves.ease,
    );

    animation.start();
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) => Opacity(
        opacity: animation.value,
        child: Transform.rotate(
          angle: widget.offsetStart * 1 - animation.value * widget.offsetStart,
          origin: Offset(1, animation.value),
          child: widget.child,
        ),
      ),
    );
  }
}
