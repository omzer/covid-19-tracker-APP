import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatelessWidget {
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
            _assetsUtils.getPNGImagePath('app'),
            width: 40,
            height: 40,
          ),
          title: Text(AppLocale.getString(context, 'about_app')),
          subtitle: Text(AppLocale.getString(context, 'app_info')),
          trailing: _buildIcon('github', _openRepo),
        ),
      ),
    );
  }

  Widget _buildIcon(String name, Function function) {
    return InkWell(
      onTap: function,
      child: Image.asset(
        _assetsUtils.getPNGImagePath(name),
        width: 30,
        height: 30,
      ),
    );
  }

  void _openRepo() => launch('http:github.com/omzer/covid-19-tracker-APP');
}
