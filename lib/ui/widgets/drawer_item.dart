import 'package:covidtracker/utils/assets_utils.dart';
import 'package:covidtracker/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String title;
  String fileName;
  Widget page;

  DrawerItem({
    this.title,
    this.fileName,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      color: Colors.blueAccent.withOpacity(.2),
      child: InkWell(
        onTap: () {
          NavigationUtils.popPage(context);
          NavigationUtils.navigateTo(context, page);
        },
        child: ListTile(
          leading: _buildIcon(),
          title: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Image.asset(AssetsUtils.getPNGImagePath(fileName), width: 30);
  }
}
