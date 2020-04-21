import 'package:covidtracker/repo/api.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    API.getInstance().getChartData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Text('Statistics page'),
      ),
    );
  }
}
