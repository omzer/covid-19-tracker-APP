import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:flutter/material.dart';

class AboutContributors extends StatelessWidget {
  AssetsUtils _assetsUtils = AssetsUtils.getInstance();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ListTile(
          leading: Image.asset(
            _assetsUtils.getPNGImagePath('thanks'),
            width: 40,
            height: 40,
          ),
          title: Text(AppLocale.getString(context, 'about_contributors')),
          subtitle: Text(AppLocale.getString(context, 'made_possible_by')),
        ),
      ),
    );
  }
}
