import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:covidtracker/ui/widgets/symptom_item.dart';
import 'package:flutter/material.dart';

class PreventionPage extends StatelessWidget {
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
        DarkAppBar(title: AppLocale.getString(context, 'prevention')),
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
          fileName: 'house',
          title: AppLocale.getString(context, 'stay_home'),
        ),
        ImageAndText(
          fileName: 'handwash',
          title: AppLocale.getString(context, 'wash_hands'),
        ),
        ImageAndText(
          fileName: 'safe_distance',
          title: AppLocale.getString(context, 'keep_distance'),
        ),
        ImageAndText(
          fileName: 'sneeze',
          title: AppLocale.getString(context, 'cover_cough'),
        ),
        ImageAndText(
          fileName: 'medical_stuff',
          title: AppLocale.getString(context, 'feel_sick'),
        ),
        ImageAndText(
          fileName: 'avoid_travel',
          title: AppLocale.getString(context, 'avoid_travelling'),
        ),
        ImageAndText(
          fileName: 'cook_home',
          title: AppLocale.getString(context, 'cook_home'),
        ),
        ImageAndText(
          fileName: 'mask',
          title: AppLocale.getString(context, 'wear_mask'),
        ),
        ImageAndText(
          fileName: 'shake_hands',
          title: AppLocale.getString(context, 'shake_hands'),
        ),
        ImageAndText(
          fileName: 'avoid_social',
          title: AppLocale.getString(context, 'avoid_social'),
        ),
      ],
    );
  }
}
