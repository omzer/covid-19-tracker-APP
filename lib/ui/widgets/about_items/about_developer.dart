import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDeveloper extends StatelessWidget {
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
            _assetsUtils.getPNGImagePath('developer'),
            width: 30,
            height: 30,
          ),
          title: Text(AppLocale.getString(context, 'about_developer')),
          subtitle: Text(AppLocale.getString(context, 'developed_by')),
          trailing: Wrap(
            children: <Widget>[
              _buildIcon('facebook', _openFacebook),
              SizedBox(width: 10),
              _buildIcon('gmail', _sendMail),
            ],
          ),
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

  void _openFacebook() => launch('http:fb.me/sha.sfx');

  void _sendMail() => launch('mailto:oz9.sa7@gmail.com');
}
