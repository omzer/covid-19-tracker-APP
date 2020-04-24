import 'package:covidtracker/models/region_info.dart';
import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:flutter/material.dart';

class CitiesPage extends StatelessWidget {
  API _api = API.getInstance();

  @override
  Widget build(BuildContext context) {
    API.getInstance().getChartData();
    return Scaffold(
      body: DarkBackground(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        DarkAppBar(title: 'Cities'),
        FutureBuilder(
          future: _api.getRegions(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting)
              return WorldLoading();
            return Expanded(child: _buildListOfCities(snap.data));
          },
        )
      ],
    );
  }

  Widget _buildListOfCities(List<RegionInfo> list) {
    list.sort((a, b) => -(a.cases - b.cases));

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        String name = list[index].name;
        String cases = list[index].cases.toString();
        return Card(
          elevation: 2,
          margin: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage(AssetsUtils.getInstance().getJPGImagePath(name)),
              radius: 30,
            ),
            title: Text(list[index].name),
            subtitle: Text(cases),
          ),
        );
      },
    );
  }
}
