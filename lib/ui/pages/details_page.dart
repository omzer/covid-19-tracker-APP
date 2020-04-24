import 'package:covidtracker/models/summary_model.dart';
import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/details_item.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  API _api = API.getInstance();

  @override
  Widget build(BuildContext context) {
    API.getInstance().getChartData();
    return Scaffold(
      body: DarkBackground(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        DarkAppBar(title: 'Details'),
        FutureBuilder(
          future: _api.getSummary(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting)
              return WorldLoading();
            return Expanded(child: _buildDetailsList(snap.data));
          },
        )
      ],
    );
  }

  Widget _buildDetailsList(SummaryModel model) {
    return ListView(
      children: <Widget>[
        // Westbank
        DetailsItem(
          region: 'Westbank and Gaza',
          title: 'WestBank: ${model.totalWestbank} Gaza: ${model.totalGaza}',
          total: model.totalCases,
          lost: model.totalDeath,
          recovery: model.totalRecovery,
        ),
        // Jerusalem
        DetailsItem(
          region: 'Jerusalem',
          title: 'Cases in jerusalem',
          total: model.totalLostInJerusalem,
          lost: model.totalLostInJerusalem,
          recovery: model.totalRecoveryInJerusalem,
        ),
        // Abroad
        DetailsItem(
          region: 'Abroad',
          title: 'Palestinians outside palestine',
          total: model.totalCasesInAbroad,
          lost: model.totalLostInAbroad,
          recovery: model.totalRecoveryInAbroad,
        ),
      ],
    );
  }
}
