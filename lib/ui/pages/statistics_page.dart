import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/charts/active_cases.dart';
import 'package:covidtracker/ui/widgets/charts/daily_cases.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  API _api = API.getInstance();

  @override
  Widget build(BuildContext context) {
    API.getInstance().getChartData();
    return Scaffold(
      body: DarkBackground(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(
      future: _api.getChartData(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting)
          return WorldLoading();
        return _buildDataGraphs(snap.data);
      },
    );
  }

  Widget _buildDataGraphs(data) {
    return ListView(
      children: <Widget>[
        DarkAppBar(title: 'Statistics'),
        ActiveCases(dataList: data),
        DailyCases(dataList: data),
      ],
    );
  }
}
