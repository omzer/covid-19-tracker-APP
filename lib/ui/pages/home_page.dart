import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/animated_cases_list.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/drawer.dart';
import 'package:covidtracker/ui/widgets/summary_section.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainPageDrawer(),
      body: DarkBackground(child: _buildBodyWidgets()),
    );
  }

  Widget _buildBodyWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle(),
        _buildSummaryText(),
        _buildSummarySection(),
        _buildLatestText(),
        _buildRecentSection(),
      ],
    );
  }

  Widget _buildRecentSection() {
    return FutureBuilder(
      future: API.getInstance().getCases(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) return Container();
        return AnimatedCasesList(list: snap.data);
      },
    );
  }

  Widget _buildLatestText() {
    TextStyle style = TextStyle(fontSize: 22, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Text(
        'Recent cases',
        style: style,
      ),
    );
  }

  Widget _buildSummaryText() {
    TextStyle style = TextStyle(fontSize: 22, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
      child: Text(
        'Summary',
        style: style,
      ),
    );
  }

  Widget _buildTitle() {
    TextStyle style = TextStyle(fontSize: 22, color: Colors.white);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            'COVID-19 Tracking in Palestine',
            style: style,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    return FutureBuilder(
      future: API.getInstance().getSummary(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting)
          return WorldLoading();
        return Center(child: SummarySection(summaryModel: snap.data));
      },
    );
  }
}
