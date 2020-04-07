class SummaryModel {
  int totalCases;
  int totalRecovery;
  int totalActiveCases;
  int totalDeath;
  int totalCriticalCases;
  int totalTestedSamples;
  int homeQuarantine;
  int centralQuarantine;
  String detailedMap;

  SummaryModel.fromJson(dynamic json) {
    totalCases = json['TotalCases'];
    totalRecovery = json['TotalRecovery'];
    totalActiveCases = json['TotalActiveCases'];
    totalDeath = json['TotalDeath'];
    totalCriticalCases = json['TotalCriticalCases'];
    totalTestedSamples = json['TotalTestedSamples'];
    homeQuarantine = json['HomeQuarantine'];
    centralQuarantine = json['CentralQuarantine'];
    detailedMap = json['DetailedMap'];
  }
}
