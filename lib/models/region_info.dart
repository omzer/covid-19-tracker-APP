class RegionInfo {
  String name;
  int cases;
  String centralQuarantine;
  String homeQuarantine;

  RegionInfo.fromJson(dynamic json) {
    name = json['Name'].toString().replaceAll(' ', '');
    cases = int.parse(json['Cases'] ?? '0');
    centralQuarantine = json['CentralQuarantine'] ?? '0';
    homeQuarantine = json['HomeQuarantine'] ?? '0';
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
