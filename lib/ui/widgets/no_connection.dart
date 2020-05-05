import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/utils/decoration_utils.dart';
import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  DecorationUtils _decorationUtils = DecorationUtils.getInstance();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: _decorationUtils.getContainerBorder(Colors.white),
        child: Text(
          AppLocale.getString(context, 'connection_error_message'),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
