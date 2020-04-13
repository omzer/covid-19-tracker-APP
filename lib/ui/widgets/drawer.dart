import 'dart:ui';

import 'package:flutter/material.dart';

import 'drawer_item.dart';

class MainPageDrawer extends StatefulWidget {
  @override
  _MainPageDrawerState createState() => _MainPageDrawerState();
}

class _MainPageDrawerState extends State<MainPageDrawer> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        color: Colors.blueGrey.withOpacity(.2),
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.blueGrey.withOpacity(.35),
              centerTitle: true,
              title: Text('Quick options'),
              leading: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            DrawerItem(title: 'Option 1', onPress: () {}),
            DrawerItem(title: 'Option 2', onPress: () {}),
            DrawerItem(title: 'Option 3', onPress: () {}),
            Spacer(),
            DrawerItem(title: 'About', onPress: () {}),
          ],
        ),
      ),
    );
  }
}
