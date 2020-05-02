import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:flutter/material.dart';

class SymptomsPage extends StatelessWidget {
  BuildContext context;

  AssetsUtils _assetsUtils = AssetsUtils.getInstance();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: DarkBackground(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        DarkAppBar(title: AppLocale.getString(context, 'symptoms')),
        Expanded(child: _buildList()),
      ],
    );
  }

  Widget _buildList() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      children: <Widget>[
        _buildSymptomItem(),
        _buildSymptomItem(),
        _buildSymptomItem(),
        _buildSymptomItem(),
        _buildSymptomItem(),
        _buildSymptomItem(),
        _buildSymptomItem(),
      ],
    );
  }

  Widget _buildSymptomItem() {
    return Stack(
      children: <Widget>[
        _buildCardBody(),
        _buildImage(),
      ],
    );
  }

  Widget _buildCardBody() {
    return Positioned(
      top: 50,
      right: 0,
      left: 0,
      bottom: 0,
      child: Card(),
    );
  }

  Widget _buildImage() {
    return Positioned(
      top: 8,
      left: 8,
      child: Image.asset(
        _assetsUtils.getPNGImagePath('fever'),
        width: 80,
      ),
    );
  }
}
