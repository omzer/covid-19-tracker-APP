import 'package:covidtracker/lang/locale.dart';
import 'package:covidtracker/models/region_info.dart';
import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/dark_background.dart';
import 'package:covidtracker/ui/widgets/home_appbar.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:covidtracker/utils/decoration_utils.dart';
import 'package:flutter/material.dart';

class CitiesPage extends StatelessWidget {
  API _api = API.getInstance();
  BuildContext context;
  DecorationUtils _decorationUtils = DecorationUtils.getInstance();

  @override
  Widget build(BuildContext context) {
    API.getInstance().getChartData();
    this.context = context;
    return Scaffold(
      body: DarkBackground(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        DarkAppBar(title: AppLocale.getString(context, 'cities')),
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

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: list.length,
      itemBuilder: (context, index) {
        String name = list[index].name;
        String cases = list[index].cases.toString();
        return Card(
          shape: _decorationUtils.getCardRoundedBorder(12),
          color: Colors.black.withOpacity(0.2),
          elevation: 3,
          margin: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Expanded(
                child: _decorationUtils.clipTopWithRadius(
                  Image.asset(
                    AssetsUtils.getInstance().getJPGImagePath(name),
                    fit: BoxFit.cover,
                  ),
                  12,
                ),
              ),
              Text(
                AppLocale.getUnknownString(context, list[index].name),
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(cases, style: TextStyle(color: Colors.white)),
            ],
          ),
        );
      },
    );
  }
}
