import 'package:covidtracker/utils/decoration_utils.dart';
import 'package:flutter/material.dart';

class NumberBadge extends StatelessWidget {
  String number;
  DecorationUtils _decorationUtils = DecorationUtils.getInstance();

  NumberBadge({this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text('#$number', style: TextStyle(color: Colors.white)),
      decoration: _decorationUtils.getContainerDecoration(
        25,
        Colors.blue.withOpacity(.6),
      ),
    );
  }
}
