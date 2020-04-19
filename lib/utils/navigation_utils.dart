import 'package:flutter/material.dart';

class NavigationUtils {
  static NavigationUtils _navigationUtils;

  static NavigationUtils getInstance() {
    return _navigationUtils ?? (_navigationUtils = NavigationUtils());
  }

  Future<dynamic> navigateTo(context, page) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => page);
    Future<dynamic> push = Navigator.push(context, route);
    return push;
  }

  void popPage(context) {
    Navigator.pop(context);
  }

  void popPageWithData(context, data) {
    Navigator.pop(context, data);
  }
}
