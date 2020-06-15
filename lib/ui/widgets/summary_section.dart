import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/models/summary_model.dart';
import 'package:covidtracker/ui/widgets/animated_entrance_widget.dart';
import 'package:covidtracker/ui/widgets/summary_item.dart';
import 'package:flutter/material.dart';

class SummarySection extends StatelessWidget {
  SummaryModel summaryModel;
  BuildContext context;

  SummarySection({this.summaryModel});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Center(
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: <Widget>[
          AnimatedEntranceWidget(
            child: _buildTotalCases(),
            offsetStart: -0.5,
            offsetEnd: -0.5,
          ),
          AnimatedEntranceWidget(
            child: _buildRecoveredCases(),
            offsetStart: 0.5,
            offsetEnd: -0.5,
          ),
          AnimatedEntranceWidget(
            child: _buildTestedSamples(),
            offsetStart: -0.5,
            offsetEnd: 0.5,
          ),
          AnimatedEntranceWidget(
            child: _buildLostPeople(),
            offsetStart: 0.5,
            offsetEnd: 0.5,
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCases() {
    return SummaryItem(
      startColor: Color(0xff676ef6),
      endColor: Color(0xff8ba4f8),
      title: summaryModel.totalCasesWithJerusalem,
      subtitle: AppLocale.getString(context, 'total'),
      icon: 'people',
    );
  }

  Widget _buildLostPeople() {
    return SummaryItem(
      startColor: Color(0xff36405e),
      endColor: Color(0xff5a668a),
      title: summaryModel.totalLostWithJerusalem,
      subtitle: AppLocale.getString(context, 'lost'),
      icon: 'death',
    );
  }

  Widget _buildRecoveredCases() {
    return SummaryItem(
      startColor: Color(0xff62a340),
      endColor: Color(0xff9bde78),
      title: summaryModel.totalRecoveryWithJerusalem,
      subtitle:
          '${AppLocale.getString(context, 'recovered')} (${_recoveredPercent()}%)',
      icon: 'plus',
    );
  }

  int _recoveredPercent() {
    double total = double.parse(summaryModel.totalCasesWithJerusalem);
    double recovered = double.parse(summaryModel.totalRecoveryWithJerusalem);
    double death = double.parse(summaryModel.totalLostWithJerusalem);
    return (100 * recovered / (total - death)).floor();
  }

  Widget _buildTestedSamples() {
    return SummaryItem(
      startColor: Color(0xffd05a81),
      endColor: Color(0xfff19aae),
      title: summaryModel.totalTestedSamples,
      subtitle: AppLocale.getString(context, 'tested_samples'),
      icon: 'sample',
    );
  }
}
