import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/ui/widgets/details_section.dart';
import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  String region, total, title, recovery, lost;
  BuildContext context;

  DetailsItem({
    this.region,
    this.total,
    this.title,
    this.recovery,
    this.lost,
  });

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Card(
      color: Colors.black.withOpacity(.2),
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _buildRegion(),
            _buildTitle(),
            SizedBox(height: 8),
            _buildTotal(),
            _buildRecovery(),
            _buildLost(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    if (title == null) return SizedBox();
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white.withOpacity(.7),
      ),
    );
  }

  Widget _buildRegion() {
    return Text(
      region,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildTotal() {
    return DetailsSection(
      title: '${AppLocale.getString(context, 'total_cases')}: $total',
      icon: 'people',
      startColor: Color(0xff676ef6),
      endColor: Color(0xff8ba4f8),
    );
  }

  Widget _buildRecovery() {
    return DetailsSection(
      title: '${AppLocale.getString(context, 'total_recovery')}: $recovery',
      icon: 'plus',
      startColor: Color(0xff62a340),
      endColor: Color(0xff9bde78),
    );
  }

  Widget _buildLost() {
    return DetailsSection(
      title: '${AppLocale.getString(context, 'total_lost')}: $lost',
      icon: 'death',
      startColor: Color(0xffd05a81),
      endColor: Color(0xfff19aae),
    );
  }
}
