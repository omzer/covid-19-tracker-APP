import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/models/emrgency_number_model.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:covidtracker/utils/navigation_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContact extends StatelessWidget {
  EmergencyNumberModel model;
  bool isArabic;
  BuildContext mContext;
  AssetsUtils _assetsUtils = AssetsUtils.getInstance();
  NavigationUtils _navigationUtils = NavigationUtils.getInstance();
  String _contactName,
      _youAreCalling,
      _keepInMind,
      _jawwal,
      _watanya,
      _whatCarrier;

  final TextStyle _whiteText = TextStyle(color: Colors.white);

  EmergencyContact({this.model, this.isArabic});

  @override
  Widget build(BuildContext context) {
    mContext = context;
    _contactName = isArabic ? model.contactNameAra : model.contactNameEng;
    _youAreCalling = AppLocale.getString(context, 'you_are_calling');
    _keepInMind = AppLocale.getString(context, 'keep_in_mind');
    _jawwal = AppLocale.getString(context, 'jawwal');
    _watanya = AppLocale.getString(context, 'watanya');
    _whatCarrier = AppLocale.getString(context, 'what_carrier');

    return Card(
      elevation: 2,
      color: Color(0xff313d57).withOpacity(.75),
      margin: EdgeInsets.fromLTRB(4, 0, 4, 8),
      child: InkWell(
        onTap: _onCallPressed,
        child: ListTile(
          title: _buildRegionName(),
          subtitle: _buildContactName(),
          leading: _buildRegionImage(),
          trailing: _buildCallingButtons(),
        ),
      ),
    );
  }

  Widget _buildRegionImage() {
    return CircleAvatar(
      backgroundImage: AssetImage(
        _assetsUtils.getJPGImagePath(model.fileName),
      ),
      radius: 25,
    );
  }

  Widget _buildRegionName() {
    String city = AppLocale.getUnknownString(mContext, model.region);
    return Text(city, style: _whiteText);
  }

  Widget _buildContactName() => Text(_contactName, style: _whiteText);

  Widget _buildCallingButtons() => Icon(Icons.call, color: Colors.white);

  void _onCallPressed() {
    showDialog(
      context: mContext,
      builder: (_) {
        return AlertDialog(
          title: Text(_whatCarrier),
          content: Text('$_youAreCalling $_contactName $_keepInMind'),
          actions: <Widget>[
            FlatButton(child: Text(_jawwal), onPressed: _onCallJawwalPressed),
            FlatButton(child: Text(_watanya), onPressed: _onCallWatanyaPressed),
          ],
        );
      },
    );
  }

  void _onCallJawwalPressed() => _makePhoneCall(model.jawwal);

  void _onCallWatanyaPressed() => _makePhoneCall(model.watanya);

  Future<void> _makePhoneCall(String tel) async {
    _navigationUtils.popPage(mContext);
    await launch('tel:$tel');
  }
}
