import 'package:covidtracker/utils/assets_utils.dart';
import 'package:covidtracker/utils/decoration_utils.dart';
import 'package:flutter/material.dart';

class SymptomsItem extends StatelessWidget {
  String fileName, title, subtitle;
  AssetsUtils _assetsUtils = AssetsUtils.getInstance();
  DecorationUtils _decorationUtils = DecorationUtils.getInstance();

  SymptomsItem({
    this.fileName,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildCardBody(_buildText()),
        _buildImage(),
      ],
    );
  }

  Widget _buildCardBody(Widget text) {
    return Positioned(
      top: 50,
      right: 0,
      left: 0,
      bottom: 0,
      child: Card(
        color: Colors.black.withOpacity(0.2),
        shape: _decorationUtils.getCardRoundedBorder(15),
        child: text,
      ),
    );
  }

  double _imageSize = 70;

  Widget _buildImage() {
    return Positioned(
      top: 8,
      left: 8,
      child: Image.asset(
        _assetsUtils.getPNGImagePath(fileName),
        width: _imageSize,
        height: _imageSize,
      ),
    );
  }

  TextStyle _titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  TextStyle _subtitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Text(title, style: _titleStyle),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                subtitle,
                style: _subtitleStyle,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
