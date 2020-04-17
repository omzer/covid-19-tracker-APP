import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  TextStyle _style = TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: _buildTitle(),
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xFF7784AB)),
    );
  }

  Widget _buildTitle() {
    return Text('COVID-19 Palestine', style: _style);
  }
}
