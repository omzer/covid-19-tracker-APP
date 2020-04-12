import 'package:covidtracker/db/prefs.dart';
import 'package:covidtracker/ui/pages/home_page.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19 Tracker',
      home: FutureBuilder(
        future: initApp(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting)
            return WorldLoading();
          return HomePage();
        },
      ),
    );
  }

  // To init needed things before entering the App
  Future<void> initApp() async {
    await Prefs.getInstance().initSharedPrefs();
  }
}
