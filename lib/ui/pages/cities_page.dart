import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:flutter/material.dart';

class CitiesPage extends StatelessWidget {
  API _api = API.getInstance();

  @override
  Widget build(BuildContext context) {
    API.getInstance().getChartData();
    return Scaffold(
      body: DarkBackground(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        DarkAppBar(title: 'Cities'),
        FutureBuilder(
          future: _api.getRegions(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting)
              return WorldLoading();
            return Text('done');
          },
        )
      ],
    );
  }
}
