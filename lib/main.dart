import 'package:covidtracker/db/prefs.dart';
import 'package:covidtracker/ui/pages/home_page.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Init localization
  EzLocalizationDelegate ezLocalization = EzLocalizationDelegate(
    getPathFunction: (locale) => 'lib/lang/$locale.json',
    supportedLocales: [Locale('en'), Locale('ar')],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Localization
      localizationsDelegates: ezLocalization.localizationDelegates,
      supportedLocales: ezLocalization.supportedLocales,
      localeResolutionCallback: ezLocalization.localeResolutionCallback,

      // Hide debugging banner
      debugShowCheckedModeBanner: false,

      // Build the App
      title: 'COVID-19 Tracker',
      home: _buildHomePage(),
    );
  }

  Widget _buildHomePage() {
    return FutureBuilder(
      future: initApp(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting)
          return WorldLoading();
        return HomePage();
      },
    );
  }

  // To init needed things before entering the App
  Future<void> initApp() async {
    await Prefs.getInstance().initSharedPrefs();
  }
}
