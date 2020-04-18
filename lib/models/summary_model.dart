import 'package:covidtracker/utils/utils.dart';

class SummaryModel {
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
    totalCases = Utils.getFormattedNumber(
      json['TotalCases'].toString(),
    );
    totalRecovery = Utils.getFormattedNumber(
      json['TotalRecovery'].toString(),
    );
    totalActiveCases = Utils.getFormattedNumber(
      json['TotalActiveCases'].toString(),
    );
    totalDeath = Utils.getFormattedNumber(
      json['TotalDeath'].toString(),
    );
    totalCriticalCases = Utils.getFormattedNumber(
      json['TotalCriticalCases'].toString(),
    );
    totalTestedSamples = Utils.getFormattedNumber(
      json['TotalTestedSamples'].toString(),
    );
    homeQuarantine = Utils.getFormattedNumber(
      json['HomeQuarantine'].toString(),
    );
    centralQuarantine = Utils.getFormattedNumber(
      json['CentralQuarantine'].toString(),
    );
    detailedMap = json['DetailedMap'].toString();
  }
}
