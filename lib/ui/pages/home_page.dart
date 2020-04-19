import 'package:covidtracker/models/case_model.dart';
import 'package:covidtracker/models/summary_model.dart';
import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/animated_cases_list.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/drawer.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:covidtracker/ui/widgets/summary_section.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SummaryModel _summaryModel;
  List<CaseModel> _caseModels;
  API _api = API.getInstance();

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
        DarkAppBar(title: 'COVID-19 Palestine'),
        _buildSummaryText(),
        _buildSummarySection(),
        _buildLatestText(),
        _buildRecentSection(),
      ],
    );
  }

  Widget _buildRecentSection() {
    if (_caseModels != null) return AnimatedCasesList(list: _caseModels);

    return FutureBuilder(
      future: _api.getCases(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) return Container();
        return AnimatedCasesList(list: (_caseModels = snap.data));
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

  Widget _buildSummarySection() {
    if (_summaryModel != null)
      return SummarySection(summaryModel: _summaryModel);

    return FutureBuilder(
      future: _api.getSummary(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting)
          return WorldLoading();
        return SummarySection(summaryModel: (_summaryModel = snap.data));
      },
    );
  }
}
