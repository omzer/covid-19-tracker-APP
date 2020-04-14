class CaseModel {
  // Case info
  String caseNumber, recordDate, source;

  // Personal info
  String age, gender, community, location;

  CaseModel.fromJson(dynamic json) {
    caseNumber = json['case_number'];
    recordDate = json['case_diagnose_date'];
    source = json['case_source_of_infection'];
    age = json['case_age'];
    gender = json['case_gender'];
    community = json['case_community'];
    location = json['case_location'];
  }
}

/**
    "case_number": "274",
    "case_diagnose_date": "2020-04-13",
    "case_source_of_infection": "Worker in Israel",

    "case_age": "27",
    "case_gender": "Male",
    "case_community": "مدينة الخليل"
    "case_location": "Hebron",

 */
