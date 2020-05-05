import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/charts/active_cases.dart';
import 'package:covidtracker/ui/widgets/charts/daily_cases.dart';
import 'package:covidtracker/ui/widgets/charts/summary_chart.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:covidtracker/ui/widgets/no_connection.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  API _api = API.getInstance();
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    API.getInstance().getChartData();
    return Scaffold(
      body: DarkBackground(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        DarkAppBar(title: AppLocale.getString(context, 'statistics')),
        FutureBuilder(
          future: _api.getChartData(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting)
              return WorldLoading();
            if (snap.data == null) return NoConnection();
            return _buildDataGraphs(snap.data);
          },
        )
      ],
    );
  }

  Widget _buildDataGraphs(data) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ActiveCases(dataList: data),
          DailyCases(dataList: data),
          SummaryChart(),
        ],
      ),
    );
  }
}
