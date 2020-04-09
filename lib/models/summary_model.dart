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
    totalCases = json['TotalCases'].toString();
    totalRecovery = json['TotalRecovery'].toString();
    totalActiveCases = json['TotalActiveCases'].toString();
    totalDeath = json['TotalDeath'].toString();
    totalCriticalCases = json['TotalCriticalCases'].toString();
    totalTestedSamples = json['TotalTestedSamples'].toString();
    homeQuarantine = json['HomeQuarantine'].toString();
    centralQuarantine = json['CentralQuarantine'].toString();
    detailedMap = json['DetailedMap'].toString();
  }
}
