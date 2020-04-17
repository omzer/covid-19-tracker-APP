import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String title;
  Function onPress;

  DrawerItem({this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        color: Colors.blue.withOpacity(.4),
        child: ListTile(
          leading: Icon(Icons.info, color: Colors.blue),
          title: Text(
            title,
            style: TextStyle(fontSize: 22, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
