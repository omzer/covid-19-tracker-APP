import 'package:covidtracker/models/summary_model.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  SummaryModel summaryModel;

  SummaryCard({@required this.summaryModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Total cases: ${summaryModel.totalCases}'),
            Text('Recovery recovery: ${summaryModel.totalRecovery}'),
            Text('Total recovery rate rate: ${_buildPercent()}%'),
            Text('Centeral quarantined: ${summaryModel.centralQuarantine}'),
            Text('Home quarantined: ${summaryModel.homeQuarantine}'),
            Text('Critical cases: ${summaryModel.totalCriticalCases}'),
            Text('Active cases: ${summaryModel.totalActiveCases}'),
          ],
        ),
      ),
    );
  }

  int _buildPercent() {
    return (100 *
            summaryModel.totalRecovery /
            summaryModel.totalCases.toDouble())
        .ceil();
  }
}
