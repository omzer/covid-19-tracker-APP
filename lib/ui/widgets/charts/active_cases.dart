import 'package:covidtracker/models/chart_data_model.dart';
import 'package:covidtracker/utils/decoration_utils.dart';
import 'package:covidtracker/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActiveCases extends StatelessWidget {
  List<Color> gradientColors = [
    const Color(0xff6ecff5),
    const Color(0xff7ea1f8),
  ];
  List<ChartDataModel> dataList;
  DecorationUtils _decorationUtils = DecorationUtils.getInstance();
  Utils _utils = Utils.getInstance();

  ActiveCases({@required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: _decorationUtils.getCardRoundedBorder(12),
      color: Colors.black.withOpacity(0.2),
      margin: EdgeInsets.all(8),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                right: 18.0, left: 12.0, top: 24, bottom: 12),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ),
    );
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: false,
      verticalInterval: 1,
      horizontalInterval: 5,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(color: const Color(0xff37434d), strokeWidth: 1);
      },
      getDrawingVerticalLine: (value) {
        return FlLine(color: const Color(0xff37434d), strokeWidth: 1);
      },
    );
  }

  FlTitlesData _buildTitleData() {
    return FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        textStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        getTitles: (value) {
          if (value == (dataList.length / 2).ceil()) return 'Active cases';
          return '';
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        getTitles: (value) {
          if (value == _maxY || value % (_maxY / 5) == 0)
            return _utils.getFormattedNumber(value.toInt().toString());
          return '';
        },
        reservedSize: 28,
        margin: 12,
      ),
    );
  }

  FlBorderData _buildBorderData() {
    return FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d), width: 1),
    );
  }

  double _maxX;
  double _maxY;
  List<FlSpot> _spots;

  void prepareData() {
    _maxY = 0;
    _spots = [];
    _maxX = 0;
    for (ChartDataModel data in dataList) {
      _maxY = data.active > _maxY ? data.active : _maxY;
      _spots.add(FlSpot(_maxX++, data.active));
    }
    _maxX -= 0.5;
  }

  LineChartData mainData() {
    prepareData();
    return LineChartData(
      gridData: _buildGridData(),
      titlesData: _buildTitleData(),
      borderData: _buildBorderData(),
      minX: 0,
      minY: 0,
      maxX: _maxX,
      maxY: _maxY + _maxY * 0.2,
      lineBarsData: [
        LineChartBarData(
          spots: _spots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.6)).toList(),
          ),
        ),
      ],
    );
  }
}
