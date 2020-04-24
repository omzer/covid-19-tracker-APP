import 'package:covidtracker/utils/assets_utils.dart';
import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  Color startColor, endColor;
  String title, subtitle, icon;
  AssetsUtils _assetsUtils = AssetsUtils.getInstance();

  SummaryItem({
    this.startColor,
    this.endColor,
    this.title,
    this.subtitle,
    this.icon,
  });

  double _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size.width / 3;

    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        gradient: _getCardGradient(),
        borderRadius: BorderRadius.circular(30),
      ),
      child: _buildStack(),
    );
  }

  Widget _buildStack() {
    return Stack(
      children: <Widget>[
        _buildSubTitle(),
        _buildTitle(),
        _buildIcon(),
      ],
    );
  }

  final TextStyle _titleStyle = new TextStyle(
    fontSize: 22,
    color: Colors.white,
  );

  final TextStyle _subtitleStyle = new TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  Widget _buildSubTitle() {
    return Positioned(
      bottom: 20,
      left: 20,
      child: Text(subtitle, style: _subtitleStyle),
    );
  }

  Widget _buildTitle() {
    return Positioned(
      bottom: 40,
      left: 20,
      child: Text(title, style: _titleStyle),
    );
  }

  Widget _buildIcon() {
    return Positioned(
      top: 10,
      right: 10,
      child: Image.asset(
        _assetsUtils.getPNGImagePath(icon),
        color: Colors.white,
        width: 30,
      ),
    );
  }

  Gradient _getCardGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: [startColor, endColor],
    );
  }
}
