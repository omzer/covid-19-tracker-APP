import 'package:covidtracker/utils/utils.dart';

class SummaryModel {
  Utils _utils = Utils.getInstance();

  // WestBank And Gaza
  String totalCases;
  String totalRecovery;
  String totalActiveCases;
  String totalDeath;
  String totalCriticalCases;
  String totalTestedSamples;
  String homeQuarantine;
  String centralQuarantine;
  String detailedMap;
  String totalWestbank;
  String totalGaza;

  // Jerusalem only
  String totalCasesInJerusalem;
  String totalRecoveryInJerusalem;
  String totalLostInJerusalem;

  // Abroad
  String totalCasesInAbroad;
  String totalRecoveryInAbroad;
  String totalLostInAbroad;

  // Total with Jerusalem
  String totalCasesWithJerusalem;
  String totalRecoveryWithJerusalem;
  String totalLostWithJerusalem;

  SummaryModel.fromJson(dynamic json) {
    totalCases = _utils.getFormattedNumber(
      json['TotalCases'].toString(),
    );
    totalRecovery = _utils.getFormattedNumber(
      json['TotalRecovery'].toString(),
    );
    totalActiveCases = _utils.getFormattedNumber(
      json['TotalActiveCases'].toString(),
    );
    totalDeath = _utils.getFormattedNumber(
      json['TotalDeath'].toString(),
    );
    totalCriticalCases = _utils.getFormattedNumber(
      json['TotalCriticalCases'].toString(),
    );
    totalTestedSamples = _utils.getFormattedNumber(
      json['TotalTestedSamples'].toString(),
    );
    homeQuarantine = _utils.getFormattedNumber(
      json['HomeQuarantine'].toString(),
    );
    centralQuarantine = _utils.getFormattedNumber(
      json['CentralQuarantine'].toString(),
    );
    detailedMap = json['DetailedMap'].toString();

    totalCasesInJerusalem = _utils.getFormattedNumber(
      json['JerusalemCityCases'].toString(),
    );
    totalRecoveryInJerusalem = _utils.getFormattedNumber(
      json['JerusalemCityRecovery'].toString(),
    );
    totalLostInJerusalem = _utils.getFormattedNumber(
      json['JerusalemCityDeaths'].toString(),
    );

    totalCasesInAbroad = _utils.getFormattedNumber(
      json['AbroadCases'].toString(),
    );
    totalRecoveryInAbroad = _utils.getFormattedNumber(
      json['AbroadRecovery'].toString(),
    );
    totalLostInAbroad = _utils.getFormattedNumber(
      json['AbroadDeaths'].toString(),
    );
    totalCasesWithJerusalem = _utils.getFormattedNumber(
      json['TotalPalestineCases'].toString(),
    );
    totalRecoveryWithJerusalem = _utils.getFormattedNumber(
      json['TotalPalestineRecovery'].toString(),
    );
    totalLostWithJerusalem = _utils.getFormattedNumber(
      json['TotalPalestineDeath'].toString(),
    );
    totalWestbank = _utils.getFormattedNumber(
      json['TotalWestBankCases'].toString(),
    );
    totalWestbank = _utils.getFormattedNumber(
      json['TotalGazaCases'].toString(),
    );
  }
}
/*
* {
  "data": {
    "LastUpdated": "2020-04-23T22:24:38+03:00",
    "TotalCases": 336,
    "TotalRecovery": 74,
    "TotalActiveCases": 260,
    "TotalDeath": 2,
    "TotalCriticalCases": 0,
    "TotalTestedSamples": 27000,
    "HomeQuarantine": "10318",
    "HomeQuarantineCumulative": 37562,
    "CentralQuarantine": "N/A",
    * "DetailedMap": "https://datawrapper.dwcdn.net/5Mdug/81/",

    "JerusalemCityCases": "144",
    "JerusalemCityRecovery": "18",
    "JerusalemCityDeaths": "2",

    "AbroadCases": "1053",
    "AbroadRecovery": "298",
    "AbroadDeaths": "49",
  --------------
  *
    "TotalPalestineCases": 480,
    "TotalPalestineRecovery": 92,
    "TotalPalestineDeath": 4,
--------------
    *
    "TotalWestBankCases": 319,
    "TotalGazaCases": 17
  }
}*/
