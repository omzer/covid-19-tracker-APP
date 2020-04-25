import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/models/summary_model.dart';
import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/details_item.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  API _api = API.getInstance();
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: DarkBackground(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        DarkAppBar(title: AppLocale.getString(context, 'details')),
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
    final String westbank = AppLocale.getString(context, 'westbank');
    final String gaza = AppLocale.getString(context, 'gaza_strip');
    return ListView(
      children: <Widget>[
        // Westbank
        DetailsItem(
          region: AppLocale.getString(context, 'westbank_and_gaza'),
          title:
              '$westbank: ${model.totalWestbank} - $gaza: ${model.totalGaza}',
          total: model.totalCases,
          lost: model.totalDeath,
          recovery: model.totalRecovery,
        ),
        // Jerusalem
        DetailsItem(
          region: AppLocale.getString(context, 'jerusalem'),
          total: model.totalCasesInJerusalem,
          lost: model.totalLostInJerusalem,
          recovery: model.totalRecoveryInJerusalem,
        ),
        // Abroad
        DetailsItem(
          region: AppLocale.getString(context, 'abroad'),
          total: model.totalCasesInAbroad,
          lost: model.totalLostInAbroad,
          recovery: model.totalRecoveryInAbroad,
        ),
      ],
    );
  }
}
