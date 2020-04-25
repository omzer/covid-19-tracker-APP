import 'package:covidtracker/utils/assets_utils.dart';
import 'package:covidtracker/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

class DetailsSection extends StatelessWidget {
  Color startColor, endColor;
  String title, icon;
  AssetsUtils _assetsUtils = AssetsUtils.getInstance();
  var _navigation = NavigationUtils.getInstance();

  DetailsSection({
    this.startColor,
    this.endColor,
    this.title,
    this.icon,
  });

  double _size;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait)
      _size = MediaQuery.of(context).size.width;
    else
      _size = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(4),
      width: _size,
      height: 50,
      decoration: BoxDecoration(
        gradient: _getCardGradient(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: _buildStack(),
    );
  }

  Widget _buildStack() {
    return Row(
      children: <Widget>[
        SizedBox(width: 8),
        _buildIcon(),
        SizedBox(width: 10),
        _buildSubTitle(),
      ],
    );
  }

  final TextStyle _subtitleStyle = new TextStyle(
    fontSize: 18,
    color: Colors.white,
  );

  Widget _buildSubTitle() {
    return Text(title, style: _subtitleStyle);
  }

  Widget _buildIcon() {
    return Image.asset(
      _assetsUtils.getPNGImagePath(icon),
      color: Colors.white,
      width: 30,
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
