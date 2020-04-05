import 'package:covidtracker/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19 Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.redAccent,
        primaryColor: Colors.redAccent,
      ),
      home: SafeArea(child: HomePage()),
    );
  }
}
