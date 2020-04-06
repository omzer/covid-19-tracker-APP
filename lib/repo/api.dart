import 'dart:convert';

import 'package:covidtracker/models/region_info.dart';
import 'package:http/http.dart' as http;

class API {
  static final String _baseURL = 'https://www.corona.ps/API';
  static final String _regions = 'governorates';

  static Future<List<RegionInfo>> getRegions() async {
    String url = '$_baseURL/$_regions';
    var response = await http.get(url);
    dynamic content = json.decode(response.body)['data'];

    // Avoid nulls
    if (content == null) return null;
    dynamic regions = content['Governorates'];

    if (regions == null) return null;

    List<RegionInfo> regionsInfo = [];
    for (dynamic region in regions) {
      regionsInfo.add(RegionInfo.fromJson(region));
    }

    return regionsInfo;
  }
}
