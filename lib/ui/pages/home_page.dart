import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/drawer.dart';
import 'package:covidtracker/ui/widgets/summary_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainPageDrawer(),
      body: DarkBackground(child: Center(child: _buildItem())),
    );
  }

  Widget _buildItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SummaryItem(
          startColor: Color(0xff676ef6),
          endColor: Color(0xff8ba4f8),
          title: '4,371',
          subtitle: 'Total',
          icon: 'people',
        ),
        SizedBox(height: 10),
        SummaryItem(
          startColor: Color(0xff36405e),
          endColor: Color(0xff5a668a),
          title: '23,123',
          subtitle: 'Tested samples',
          icon: 'sample',
        ),
        SizedBox(height: 10),
        SummaryItem(
          startColor: Color(0xff62a340),
          endColor: Color(0xff9bde78),
          title: '23,123',
          subtitle: 'Recovered',
          icon: 'plus',
        ),
        SizedBox(height: 10),
        SummaryItem(
          startColor: Color(0xffd05a81),
          endColor: Color(0xfff19aae),
          title: '23,123',
          subtitle: 'Lost',
          icon: 'death',
        ),
      ],
    );
  }
}
