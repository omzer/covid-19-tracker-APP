import 'dart:ui';

import 'package:covidtracker/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

import 'drawer_item.dart';

class MainPageDrawer extends StatefulWidget {
  @override
  _MainPageDrawerState createState() => _MainPageDrawerState();
}

class _MainPageDrawerState extends State<MainPageDrawer> {
  Color _back = Color(0xff202a42);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        color: _back.withOpacity(.5),
        child: _buildDrawerItems(),
      ),
    );
  }

  Widget _buildDrawerItems() {
    return Column(
      children: <Widget>[
        _buildAppBar(),
        DrawerItem(
            title: 'Emergancy numbers', fileName: 'phone', onPress: () {}),
        DrawerItem(title: 'Infection map', fileName: 'map', onPress: () {}),
        DrawerItem(title: 'Statistics', fileName: 'chart', onPress: () {}),
        Spacer(),
        DrawerItem(title: 'About', fileName: 'info', onPress: () {}),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: _back.withOpacity(.8),
      centerTitle: true,
      title: Text('Quick options'),
      leading: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => NavigationUtils.popPage(context),
      ),
    );
  }
}
