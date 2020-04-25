import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/ui/widgets/about_items/about_app.dart';
import 'package:covidtracker/ui/widgets/about_items/about_developer.dart';
import 'package:covidtracker/ui/widgets/about_items/data_source.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
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
        DarkAppBar(title: AppLocale.getString(context, 'about')),
        Expanded(child: _buildList()),
      ],
    );
  }

  Widget _buildList() {
    return ListView(
      children: <Widget>[
        DataSource(),
        AboutApp(),
        AboutDeveloper(),
      ],
    );
  }
}
