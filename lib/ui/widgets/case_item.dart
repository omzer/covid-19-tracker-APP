import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/models/case_model.dart';
import 'package:covidtracker/ui/widgets/number_badge.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:flutter/material.dart';

class CaseItem extends StatelessWidget {
  CaseModel caseModel;
  AssetsUtils _assetsUtils = AssetsUtils.getInstance();

  CaseItem({this.caseModel});

  final TextStyle style = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    String city = AppLocale.getUnknownString(context, caseModel.location);
    String source = AppLocale.getUnknownString(context, caseModel.source);
    return Card(
      color: Color(0xAA7E8AB1),
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: ListTile(
        leading: Image.asset(
          _assetsUtils.getPNGImagePath(_getFileName(caseModel.gender)),
          color: Colors.white,
          width: 40,
        ),
        title: Text('$city - ${caseModel.community}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${AppLocale.getString(context, 'age')}: ${caseModel.age}'),
            Text(
              '${AppLocale.getString(context, 'source')}: $source',
            ),
            Text(
              '${AppLocale.getString(context, 'record_date')}: ${caseModel.recordDate}',
            ),
          ],
        ),
        trailing: NumberBadge(number: caseModel.caseNumber),
      ),
    );
  }

  String _getFileName(String gender) {
    gender = gender.toLowerCase();
    switch (gender) {
      case 'male':
        return 'male';
      case 'female':
        return 'female';
      default:
        return 'unknown';
    }
  }
}
