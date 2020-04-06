class RegionInfo {
  String name;
  int cases;
  int centralQuarantine;
  int homeQuarantine;

  RegionInfo.fromJson(dynamic json) {
    name = json['Name'].toString().replaceAll(' ', '');
    cases = int.parse(json['Cases'] ?? '0');
    centralQuarantine = int.parse(json['CentralQuarantine'] ?? '0');
    homeQuarantine = int.parse(json['HomeQuarantine'] ?? '0');
  }
}

/**
    {
    "Name": "Jericho",
    "Cases": "0",
    "CentralQuarantine": "25",
    "HomeQuarantine": "327"
    },
 **/
