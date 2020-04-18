import 'package:covidtracker/models/emrgency_number_model.dart';
import 'package:covidtracker/repo/emrgancy_repo.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/emergency_contact.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

class EmergencyNumbersPage extends StatelessWidget {
  EmergencyRepo _repo = EmergencyRepo.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DarkBackground(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        DarkAppBar(title: 'Emergency numbers'),
        Expanded(child: _buildList()),
      ],
    );
  }

  Widget _buildList() {
    List<EmergencyNumberModel> list = _repo.getList();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => EmergencyContact(model: list[index]),
    );
  }
}