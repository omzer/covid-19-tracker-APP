import 'dart:convert';

import 'package:covidtracker/models/case_model.dart';
import 'package:covidtracker/models/region_info.dart';
import 'package:covidtracker/models/summary_model.dart';
import 'package:http/http.dart' as http;

class API {
  final String _baseURL = 'https://www.corona.ps/API';
  final String _regions = 'governorates';
  final String _summary = 'summary';
  final String _cases = 'cases';
  final int _casesLoadCapacity = 30;
  static API _api;

  static API getInstance() {
    return _api ?? (_api = API());
  }

  Future<List<RegionInfo>> getRegions() async {
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

  Future<SummaryModel> getSummary() async {
    String url = '$_baseURL/$_summary';
    var response = await http.get(url);
    dynamic content = json.decode(response.body)['data'];
    var summaryModel = SummaryModel.fromJson(content);
    return summaryModel;
  }

  Future<List<CaseModel>> getCases() async {
    String url = '$_baseURL/$_cases';
    var response = await http.get(url);
    dynamic content = json.decode(response.body)['data'];
    List<dynamic> cases = content['cases'];
    List<CaseModel> recentCases = [];

    for (int i = cases.length - _casesLoadCapacity; i < cases.length; i++) {
      recentCases.insert(0, CaseModel.fromJson(cases[i]));
    }

    return recentCases;
  }
}
