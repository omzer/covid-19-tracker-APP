import 'package:covidtracker/models/summary_model.dart';
import 'package:covidtracker/repo/api.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SummaryChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SummaryChartState();
}

class SummaryChartState extends State {
  int _touchedIndex;
  double _active = 100, _recovered = 0, _lost = 0;
  API _api = API.getInstance();

  @override
  Widget build(BuildContext context) {
    if (_lost == 0) initData();
    return AspectRatio(
      aspectRatio: 1.5,
      child: Card(
        margin: EdgeInsets.all(8),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(height: 18),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: _buildChart(),
              ),
            ),
            _buildLegend(),
            const SizedBox(width: 28),
          ],
        ),
      ),
    );
  }

  void initData() async {
    SummaryModel summaryModel = await _api.getSummary();
    if (summaryModel == null) return;

    setState(() {
      double total = double.parse(summaryModel.totalCases);
      double lost = double.parse(summaryModel.totalDeath);
      double recovered = double.parse(summaryModel.totalRecovery);

      _active = 100 * ((total - lost - recovered) / total);
      _lost = 100 * (lost / total);
      _recovered = 100 * (recovered / total);

      double sum = _active + _lost + _recovered;
      if (sum < 100) _active = 100 - sum;
    });
  }

  Widget _buildLegend() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          'Active',
          style: TextStyle(fontSize: 18, color: Color(0xff676ef6)),
        ),
        Text(
          'Recovered',
          style: TextStyle(fontSize: 18, color: Color(0xff62a340)),
        ),
        Text(
          'Lost',
          style: TextStyle(fontSize: 18, color: Color(0xffd05a81)),
        ),
        SizedBox(height: 40),
      ],
    );
  }

  Widget _buildChart() {
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
          setState(() {
            if (pieTouchResponse.touchInput is FlLongPressEnd ||
                pieTouchResponse.touchInput is FlPanEnd) {
              _touchedIndex = -1;
            } else {
              _touchedIndex = pieTouchResponse.touchedSectionIndex;
            }
          });
        }),
        borderData: FlBorderData(show: false),
        sectionsSpace: 0,
        centerSpaceRadius: 45,
        sections: showingSections(),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    String activeString = _active.toString();
    String recoveredString = _recovered.toString();
    String lostString = _lost.toString();
    if (activeString.length > 4) activeString = activeString.substring(0, 4);
    if (recoveredString.length > 4)
      recoveredString = recoveredString.substring(0, 4);
    if (lostString.length > 4) lostString = lostString.substring(0, 4);

    return List.generate(3, (i) {
      final isTouched = (i == _touchedIndex);
      final double fontSize = isTouched ? 18 : 14;
      final double radius = isTouched ? 60 : 50;

      switch (i) {
        // Active
        case 0:
          return PieChartSectionData(
            color: Color(0xff676ef6),
            value: _active,
            title: '$activeString%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        // Recovered
        case 1:
          return PieChartSectionData(
            color: const Color(0xff9bde78),
            value: _recovered,
            title: '$recoveredString%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        // Lost
        case 2:
          return PieChartSectionData(
            color: const Color(0xffd05a81),
            value: _lost,
            title: '$lostString%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
