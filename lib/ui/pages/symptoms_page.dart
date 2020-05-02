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
        SymptomsItem(
          fileName: 'fever',
          title: 'High fever',
          subtitle: 'High fever grater than 39 C°, last for 3-4 days.',
        ),
        SymptomsItem(
          fileName: 'breath',
          title: 'Out of breath',
          subtitle: 'Bearhing is getting more strained and struggle to breath.',
        ),
        SymptomsItem(
          fileName: 'tired',
          title: 'Tiredness',
          subtitle: 'Feeling tired easily, and pain in the muscles.',
        ),
        SymptomsItem(
          fileName: 'cough',
          title: 'Dry cough',
          subtitle:
              'Cough is dry and persistent, you may feel even more short of breath as your body struggles to get enough oxygen.',
        ),
        SymptomsItem(
          fileName: 'bathroom',
          title: 'Diarrhoea',
          subtitle: 'Going to the bathroom more than usual.',
        ),
      ],
    );
  }
}
