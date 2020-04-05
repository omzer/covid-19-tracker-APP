import 'package:covidtracker/ui/widgets/drawer.dart';
import 'package:covidtracker/ui/widgets/region_selector.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: MainPageDrawer(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            _buildTitle(),
            RegionSelector(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
    );
  }

  Widget _buildTitle() {
    return Text(
      'COVID-19 Tracker',
      style: TextStyle(
        fontSize: 32,
        color: Colors.white,
      ),
    );
  }
}
