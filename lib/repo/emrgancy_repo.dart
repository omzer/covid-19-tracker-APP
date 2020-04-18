import 'package:covidtracker/models/emrgency_number_model.dart';

class EmergencyRepo {
  List<EmergencyNumberModel> _emergencyNumbers;
  static EmergencyRepo _emergencyRepo;

  static EmergencyRepo getInstance() {
    return _emergencyRepo ?? (_emergencyRepo = EmergencyRepo());
  }

  List<EmergencyNumberModel> getList() {
    if (_emergencyNumbers != null) return _emergencyNumbers;
    _fillArray();
    return _emergencyNumbers;
  }

  void _fillArray() {
    _emergencyNumbers = [];
    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Jerusalem',
      fileName: 'Jerusalem',
      contactName: 'Dr. Fares Qataniny',
      jawwal: '0592392662',
      watanya: '123456789',
    ));
    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Tulkarm',
      fileName: 'Tulkarm',
      contactName: 'د. محود حركشاني',
      jawwal: '0592392662',
      watanya: '123456789',
    ));
    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Qalqilya',
      fileName: 'Qalqilya',
      contactName: 'د. محمد صويلح',
      jawwal: '0592392662',
      watanya: '123456789',
    ));
    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));
        _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'د. فتحي عاصي',
      jawwal: '0731236534',
      watanya: '0589347892',
    ));

  }
}
