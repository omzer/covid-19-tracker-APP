import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/cupertino.dart';

class AppLocale {
  static String _getOrDefault(BuildContext context, String key) {
    return context.getString(key) ?? key;
  }

  static String _get(BuildContext context, String key) {
    return context.getString(key);
  }

  static String getString(BuildContext context, String key) {
    return _getOrDefault(context, key);
  }

  static String getUnknownString(BuildContext context, String key) {
    String city = _get(context, key.toLowerCase().replaceAll(' ', '_'));
    return city ?? key;
  }
}
