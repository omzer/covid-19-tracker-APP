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
      contactName: 'Dr. Fares Qatanani',
      jawwal: '0593716120',
      watanya: '0562401994',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Hebron',
      fileName: 'Hebron',
      contactName: 'Dr. Mohammad El-Sa\'afeen',
      jawwal: '0593716121',
      watanya: '0562401774',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nothren Hebron',
      fileName: 'Hebron',
      contactName: 'Dr. Maher Melhem',
      jawwal: '0593716122',
      watanya: '0562401442',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Southern Hebron',
      fileName: 'Hebron',
      contactName: 'Dr. Mohteser El-Qawasmi',
      jawwal: '0593716123',
      watanya: '0562401243',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Yatta',
      fileName: 'Hebron',
      contactName: 'Dr. Issa Allan',
      jawwal: '0593716124',
      watanya: '0562402180',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Bethlehem',
      fileName: 'Bethlehem',
      contactName: 'Dr. Nabeel Zawahra',
      jawwal: '0593716125',
      watanya: '0562401784',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Ramallah',
      fileName: 'Ramallah',
      contactName: 'Dr. Helmi Zyada',
      jawwal: '0593716126',
      watanya: '0562401269',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Jericho',
      fileName: 'Jericho',
      contactName: 'Dr. Tariq Hawash',
      jawwal: '0593716127',
      watanya: '0562401867',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Salfit',
      fileName: 'Salfit',
      contactName: 'Dr. Joma El-Sha\'ibi',
      jawwal: '0593716128',
      watanya: '0562402035',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactName: 'Dr. Elaf Abu-Zaroor',
      jawwal: '0593716129',
      watanya: '0562401956',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Qalqilya',
      fileName: 'Qalqilya',
      contactName: 'Dr. Mohammad Sweleih',
      jawwal: '0593716130',
      watanya: '0562401890',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Tulkarm',
      fileName: 'Tulkarm',
      contactName: 'Dr. Ihab Awwad',
      jawwal: '0593716131',
      watanya: '0562401047',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Jenin',
      fileName: 'Jenin',
      contactName: 'Dr. Abdullah Abu-Hatab',
      jawwal: '0593716132',
      watanya: '0562402098',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Tubas',
      fileName: 'Tubas',
      contactName: 'Dr. Qadri Daraghmah',
      jawwal: '0593716133',
      watanya: '0599201146',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nothern',
      fileName: 'Jenin',
      contactName: 'Dr. Wesam Subihat',
      jawwal: '0593716139',
      watanya: '0562402099',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Middle',
      fileName: 'Qalqilya',
      contactName: 'Dr. Ali Abd-Rabbuh',
      jawwal: '0593716140',
      watanya: '0562401668',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Southern',
      fileName: 'Jerusalem',
      contactName: 'Dr. Ibrahim El-Shakhrah',
      jawwal: '0593716138',
      watanya: '0562401629',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Jericho and Jordan valley',
      fileName: 'Jericho',
      contactName: 'Dr. Arb Anany',
      jawwal: '0593714137',
      watanya: '0562401872',
    ));
  }
}
