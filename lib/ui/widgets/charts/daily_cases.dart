import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/models/chart_data_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DailyCases extends StatelessWidget {
  List<ChartDataModel> dataList;

  DailyCases({@required this.dataList});

  BuildContext context;
  List<BarChartRodData> _list;
  double _maxY;
  int _maxX;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    getData();
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.center,
            maxY: _maxY,
            minY: 0,
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: getToolTip(),
              allowTouchBarBackDraw: true,
              handleBuiltInTouches: true,
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                margin: 8,
                getTitles: (double value) {
                  return AppLocale.getString(context, 'daily_cases');
                },
              ),
              leftTitles: SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(
              show: true,
            ),
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: _list,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarTouchTooltipData getToolTip() {
    return BarTouchTooltipData(
      tooltipPadding: EdgeInsets.all(3),
      tooltipBgColor: Colors.black.withOpacity(.6),
      tooltipBottomMargin: 4,
      getTooltipItem: (_, __, rod, index) {
        int val = rod.y.round();
        return BarTooltipItem(
            '$val in ${dataList[index].date.substring(5).replaceAll('-', '/')}',
            TextStyle(color: Colors.white));
      },
    );
  }

  void getData() {
    _list = [];
    _maxY = 0;
    _maxX = 0;
    for (int i = 0; i < dataList.length; i++) {
      _maxX++;
      double val = dataList[i].active - (i == 0 ? 0 : dataList[i - 1].active);
      // Get abs value
      if (val < 0) val *= -1;
      // Calculate maxY
      if (val > _maxY) _maxY = val;

      _list.add(
        BarChartRodData(
          y: val,
          color: Colors.blueAccent,
          width: 4,
        ),
      );
    }
    _maxY += 5;
  }
}
