import 'dart:ui';

import 'package:covidtracker/ui/pages/about_page.dart';
import 'package:covidtracker/ui/pages/cities_page.dart';
import 'package:covidtracker/ui/pages/details_page.dart';
import 'package:covidtracker/ui/pages/emergency_numbers_page.dart';
import 'package:covidtracker/ui/pages/map_page.dart';
import 'package:covidtracker/ui/pages/statistics_page.dart';
import 'package:covidtracker/utils/navigation_utils.dart';
import 'package:ez_localization/ez_localization.dart';
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
          title: context.getString('emergency_numbers'),
          fileName: 'phone',
          page: EmergencyNumbersPage(),
        ),
        DrawerItem(
          title: context.getString('infection_map'),
          fileName: 'map',
          page: MapPage(),
        ),
        DrawerItem(
          title: context.getString('statistics'),
          fileName: 'chart',
          page: StatisticsPage(),
        ),
        DrawerItem(
          title: context.getString('details'),
          fileName: 'details',
          page: DetailsPage(),
        ),
        DrawerItem(
          title: context.getString('cities'),
          fileName: 'cities',
          page: CitiesPage(),
        ),
        DrawerItem(
          title: context.getString('about'),
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
      title: Text(context.getString('quick_options')),
      leading: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => _navigationUtils.popPage(context),
      ),
    );
  }
}
