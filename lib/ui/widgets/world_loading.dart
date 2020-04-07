import 'package:flutter/material.dart';

class WorldLoading extends StatelessWidget {
  double size;

  WorldLoading({this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'lib/imgs/globe.gif',
        width: size,
        height: size,
      ),
    );
  }
}
