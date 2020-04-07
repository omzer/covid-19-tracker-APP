import 'package:flutter/material.dart';

class NavigationUtils {
  static Future<dynamic> navigateTo(context, page) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => page);
    Future<dynamic> push = Navigator.push(context, route);
    return push;
  }

  static void popPage(context) {
    Navigator.pop(context);
  }

  static void popPageWithData(context, data) {
    Navigator.pop(context, data);
  }
}
