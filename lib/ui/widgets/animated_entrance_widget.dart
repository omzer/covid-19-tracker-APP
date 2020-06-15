import 'package:flutter/material.dart';

class AnimatedEntranceWidget extends StatefulWidget {
  Widget child;
  double offsetStart, offsetEnd;

  AnimatedEntranceWidget({this.child, this.offsetStart, this.offsetEnd});

  @override
  _AnimatedEntranceWidgetState createState() => _AnimatedEntranceWidgetState();
}

class _AnimatedEntranceWidgetState extends State<AnimatedEntranceWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(widget.offsetStart, widget.offsetEnd),
            end: Offset.zero,
          ).animate(animation),
          child: widget.child),
    );
  }

  Widget _buildContainer() {
    return Container(width: 100, height: 100, color: Colors.red);
  }
}
