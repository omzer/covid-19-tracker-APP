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
    return Card(
      color: Color(0xAA7E8AB1),
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: ListTile(
        leading: Image.asset(
          _assetsUtils
              .getPNGImagePath(caseModel.gender == 'Male' ? 'male' : 'female'),
          color: Colors.white,
          width: 40,
        ),
        title: Text('${caseModel.location} - ${caseModel.community}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Age: ${caseModel.age}'),
            Text('Source: ${caseModel.source}'),
            Text('Record date: ${caseModel.recordDate}'),
          ],
        ),
        trailing: NumberBadge(number: caseModel.caseNumber),
      ),
    );
  }
}
