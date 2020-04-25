import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DataSource extends StatelessWidget {
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
            _assetsUtils.getPNGImagePath('data'),
            width: 30,
            height: 30,
          ),
          title: Text(AppLocale.getString(context, 'data_source')),
          subtitle: Text(AppLocale.getString(context, 'all_data_come')),
          trailing: _buildIcon('website_icon', _openCoronaWebsite),
        ),
      ),
    );
  }

  Widget _buildIcon(String name, Function function) {
    return InkWell(
      onTap: function,
      child: Image.asset(
        _assetsUtils.getPNGImagePath(name),
        width: 40,
        height: 40,
      ),
    );
  }

  void _openCoronaWebsite() => launch('http:corona.ps');
}
