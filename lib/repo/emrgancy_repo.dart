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
      contactNameEng: 'Dr. Fares Qatanani',
      contactNameAra: 'د.فارس قطناني',
      jawwal: '0593716120',
      watanya: '0562401994',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Hebron',
      fileName: 'Hebron',
      contactNameEng: 'Dr. Mohammad El-Sa\'afeen',
      contactNameAra: 'د.محمد السعافين',
      jawwal: '0593716121',
      watanya: '0562401774',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Northern Hebron',
      fileName: 'Hebron',
      contactNameEng: 'Dr. Maher Melhem',
      contactNameAra: 'د.ماهر ملحم',
      jawwal: '0593716122',
      watanya: '0562401442',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Southern Hebron',
      fileName: 'Hebron',
      contactNameEng: 'Dr. Mohteser El-Qawasmi',
      contactNameAra: 'د.منتصر القواسمي',
      jawwal: '0593716123',
      watanya: '0562401243',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Yatta',
      fileName: 'Hebron',
      contactNameEng: 'Dr. Issa Allan',
      contactNameAra: 'د.عيسى علان',
      jawwal: '0593716124',
      watanya: '0562402180',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Bethlehem',
      fileName: 'Bethlehem',
      contactNameEng: 'Dr. Nabeel Zawahra',
      contactNameAra: 'د.نبيل زواهرة',
      jawwal: '0593716125',
      watanya: '0562401784',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Ramallah',
      fileName: 'Ramallah',
      contactNameEng: 'Dr. Helmi Zyada',
      contactNameAra: 'د.حلمي زيادة',
      jawwal: '0593716126',
      watanya: '0562401269',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Jericho',
      fileName: 'Jericho',
      contactNameEng: 'Dr. Tariq Hawash',
      contactNameAra: 'د.طارق حواش',
      jawwal: '0593716127',
      watanya: '0562401867',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Salfit',
      fileName: 'Salfit',
      contactNameEng: 'Dr. Joma El-Sha\'ibi',
      contactNameAra: 'د.جمعة الشعيبي',
      jawwal: '0593716128',
      watanya: '0562402035',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Nablus',
      fileName: 'Nablus',
      contactNameEng: 'Dr. Elaf Abu-Zaroor',
      contactNameAra: 'د.ايلاف أبو زعرور',
      jawwal: '0593716129',
      watanya: '0562401956',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Qalqilya',
      fileName: 'Qalqilya',
      contactNameEng: 'Dr. Mohammad Sweleih',
      contactNameAra: 'د.محمد أبو صوليح',
      jawwal: '0593716130',
      watanya: '0562401890',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Tulkarm',
      fileName: 'Tulkarm',
      contactNameEng: 'Dr. Ihab Awwad',
      contactNameAra: 'د.ايهاب عواد',
      jawwal: '0593716131',
      watanya: '0562401047',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Jenin',
      fileName: 'Jenin',
      contactNameEng: 'Dr. Abdullah Abu-Hatab',
      contactNameAra: 'د.عبد الله أبو حطب',
      jawwal: '0593716132',
      watanya: '0562402098',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Tubas',
      fileName: 'Tubas',
      contactNameEng: 'Dr. Qadri Daraghmah',
      contactNameAra: 'د.قدري دراغمة',
      jawwal: '0593716133',
      watanya: '0599201146',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Northern',
      fileName: 'Jenin',
      contactNameEng: 'Dr. Wesam Subihat',
      contactNameAra: 'د.وسام صبيحات',
      jawwal: '0593716139',
      watanya: '0562402099',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Middle',
      fileName: 'Qalqilya',
      contactNameEng: 'Dr. Ali Abd-Rabbuh',
      contactNameAra: 'د.علي عبد ربو',
      jawwal: '0593716140',
      watanya: '0562401668',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Southern',
      fileName: 'Jerusalem',
      contactNameEng: 'Dr. Ibrahim El-Shakhrah',
      contactNameAra: 'د.ابراهيم الشخرة',
      jawwal: '0593716138',
      watanya: '0562401629',
    ));

    _emergencyNumbers.add(EmergencyNumberModel(
      region: 'Jericho and Jordan valley',
      fileName: 'Jericho',
      contactNameEng: 'Dr. Arb Anany',
      contactNameAra: 'د.أرب عناني',
      jawwal: '0593714137',
      watanya: '0562401872',
    ));
  }
}
