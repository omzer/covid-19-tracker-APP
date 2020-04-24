import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/models/emrgency_number_model.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:covidtracker/utils/navigation_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContact extends StatelessWidget {
  EmergencyNumberModel model;
  BuildContext mContext;
  AssetsUtils _assetsUtils = AssetsUtils.getInstance();
  NavigationUtils _navigationUtils = NavigationUtils.getInstance();
  final TextStyle _whiteText = TextStyle(color: Colors.white);

  EmergencyContact({this.model});

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Card(
      elevation: 2,
      color: Color(0xff313d57).withOpacity(.75),
      margin: EdgeInsets.fromLTRB(4, 0, 4, 8),
      child: ListTile(
        title: _buildRegionName(),
        subtitle: _buildContactName(),
        leading: _buildRegionImage(),
        trailing: _buildCallingButtons(),
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
    String city = AppLocale.getCityTranslation(mContext, model.region);
    return Text(city, style: _whiteText);
  }

  Widget _buildContactName() => Text(model.contactName, style: _whiteText);

  Widget _buildCallingButtons() {
    return IconButton(
      icon: Icon(Icons.call, color: Colors.white),
      onPressed: _onCallPressed,
    );
  }

  void _onCallPressed() {
    showDialog(
      context: mContext,
      builder: (_) {
        return AlertDialog(
          title: Text('What carrier?'),
          content: Text(
            'You are about to call ${model.contactName}\'s phone.\nkeep in mind that this is paid call',
          ),
          actions: <Widget>[
            FlatButton(child: Text('Jawwal'), onPressed: _onCallJawwalPressed),
            FlatButton(
                child: Text('Watanya'), onPressed: _onCallWatanyaPressed),
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
