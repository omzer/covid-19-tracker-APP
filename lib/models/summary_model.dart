import 'package:covidtracker/utils/utils.dart';

class SummaryModel {
  Utils _utils = Utils.getInstance();
  String totalCases;
  String totalRecovery;
  String totalActiveCases;
  String totalDeath;
  String totalCriticalCases;
  String totalTestedSamples;
  String homeQuarantine;
  String centralQuarantine;
  String detailedMap;

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
  }
}
