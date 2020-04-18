import 'package:covidtracker/models/emrgency_number_model.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:covidtracker/utils/navigation_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContact extends StatelessWidget {
  EmergencyNumberModel model;
  BuildContext mContext;

  EmergencyContact({this.model});

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Card(
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
        AssetsUtils.getJPGImagePath(model.fileName),
      ),
      radius: 25,
    );
  }

  Widget _buildRegionName() => Text(model.region);

  Widget _buildContactName() => Text(model.contactName);

  Widget _buildCallingButtons() {
    return IconButton(
      icon: Icon(Icons.call, color: Colors.blue),
      onPressed: _onCallPressed,
    );
  }

  void _onCallPressed() {
    showDialog(
      context: mContext,
      builder: (_) {
        return CupertinoAlertDialog(
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
    NavigationUtils.popPage(mContext);
    await launch('tel:$tel');
  }
}
