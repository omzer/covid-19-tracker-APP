import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:covidtracker/ui/widgets/symptom_item.dart';
import 'package:flutter/material.dart';

class SymptomsPage extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: DarkBackground(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        DarkAppBar(title: AppLocale.getString(context, 'symptoms')),
        Expanded(child: _buildList()),
      ],
    );
  }

  Widget _buildList() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      children: <Widget>[
        ImageAndText(
          fileName: 'fever',
          title: AppLocale.getString(context, 'fever_title'),
          subtitle: AppLocale.getString(context, 'fever_subtitle'),
        ),
        ImageAndText(
          fileName: 'breath',
          title: AppLocale.getString(context, 'breath_title'),
          subtitle: AppLocale.getString(context, 'breath_subtitle'),
        ),
        ImageAndText(
          fileName: 'tired',
          title: AppLocale.getString(context, 'tired_title'),
          subtitle: AppLocale.getString(context, 'tired_subtitle'),
        ),
        ImageAndText(
          fileName: 'cough',
          title: AppLocale.getString(context, 'cough_title'),
          subtitle: AppLocale.getString(context, 'cough_subtitle'),
        ),
        ImageAndText(
          fileName: 'bathroom',
          title: AppLocale.getString(context, 'diarrhoea_title'),
          subtitle: AppLocale.getString(context, 'diarrhoea_subtitle'),
        ),
      ],
    );
  }
}
