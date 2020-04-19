import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MapPage extends StatelessWidget {
  API _api = API.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DarkBackground(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        DarkAppBar(
          title: 'Infection map',
        ),
        Expanded(
          child: WebviewScaffold(
            url: _api.getMapLink(),
            hidden: true,
            withZoom: true,
          ),
        ),
      ],
    );
  }
}
