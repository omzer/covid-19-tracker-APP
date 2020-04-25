import 'dart:ui';

import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/ui/pages/about_page.dart';
import 'package:covidtracker/ui/pages/cities_page.dart';
import 'package:covidtracker/ui/pages/details_page.dart';
import 'package:covidtracker/ui/pages/emergency_numbers_page.dart';
import 'package:covidtracker/ui/pages/map_page.dart';
import 'package:covidtracker/ui/pages/statistics_page.dart';
import 'package:covidtracker/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

import 'drawer_item.dart';

class MainPageDrawer extends StatefulWidget {
  @override
  _MainPageDrawerState createState() => _MainPageDrawerState();
}

class _MainPageDrawerState extends State<MainPageDrawer> {
  Color _back = Color(0xff202a42);
  NavigationUtils _navigationUtils = NavigationUtils.getInstance();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: _back.withOpacity(.5),
        child: Column(
          children: <Widget>[
            _buildAppBar(),
            Expanded(child: _buildDrawerItems()),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItems() {
    return ListView(
      children: <Widget>[
        DrawerItem(
          title: AppLocale.getString(context, 'emergency_numbers'),
          fileName: 'phone',
          page: EmergencyNumbersPage(),
        ),
        DrawerItem(
          title: AppLocale.getString(context, 'infection_map'),
          fileName: 'map',
          page: MapPage(),
        ),
        DrawerItem(
          title: AppLocale.getString(context, 'statistics'),
          fileName: 'chart',
          page: StatisticsPage(),
        ),
        DrawerItem(
          title: AppLocale.getString(context, 'details'),
          fileName: 'details',
          page: DetailsPage(),
        ),
        DrawerItem(
          title: AppLocale.getString(context, 'cities'),
          fileName: 'cities',
          page: CitiesPage(),
        ),
        DrawerItem(
          title: AppLocale.getString(context, 'about'),
          fileName: 'info',
          page: AboutPage(),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: _back.withOpacity(.8),
      centerTitle: true,
      title: Text(AppLocale.getString(context, 'quick_options')),
      leading: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => _navigationUtils.popPage(context),
      ),
    );
  }
}
