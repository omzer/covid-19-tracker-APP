import 'package:covidtracker/models/summary_model.dart';
import 'package:covidtracker/ui/widgets/summary_item.dart';
import 'package:flutter/material.dart';

class SummarySection extends StatelessWidget {
  SummaryModel summaryModel;

  SummarySection({this.summaryModel});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: <Widget>[
        _buildTotalCases(),
        _buildRecoveredCases(),
        _buildLostPeople(),
        _buildTestedSamples(),
      ],
    );
  }

  Widget _buildTotalCases() {
    return SummaryItem(
      startColor: Color(0xff676ef6),
      endColor: Color(0xff8ba4f8),
      title: '4,371',
      subtitle: 'Total',
      icon: 'people',
    );
  }

  Widget _buildTestedSamples() {
    return SummaryItem(
      startColor: Color(0xff36405e),
      endColor: Color(0xff5a668a),
      title: '23,123',
      subtitle: 'Tested samples',
      icon: 'sample',
    );
  }

  Widget _buildRecoveredCases() {
    return SummaryItem(
      startColor: Color(0xff62a340),
      endColor: Color(0xff9bde78),
      title: '23,123',
      subtitle: 'Recovered',
      icon: 'plus',
    );
  }

  Widget _buildLostPeople() {
    return SummaryItem(
      startColor: Color(0xffd05a81),
      endColor: Color(0xfff19aae),
      title: '23,123',
      subtitle: 'Lost',
      icon: 'death',
    );
  }
}
