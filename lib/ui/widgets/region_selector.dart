import 'package:covidtracker/ui/pages/regions_page.dart';
import 'package:covidtracker/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

class RegionSelector extends StatefulWidget {
  Function onRegionSelected;

  RegionSelector({@required this.onRegionSelected});

  @override
  _RegionSelectorState createState() => _RegionSelectorState();
}

class _RegionSelectorState extends State<RegionSelector> {
  String _region = "PS";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onRegionSelectorTapped(context),
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 5,
        child: ListTile(
          leading: FadeInImage.assetNetwork(
            placeholder: getPlaceHolderImage(),
            image: getRegionImage(),
            width: 50,
          ),
          title: Text('Palestine'),
          subtitle: Text('123,534 Confirmed case'),
        ),
        color: Colors.white.withOpacity(.85),
      ),
    );
  }

  void _onRegionSelectorTapped(context) async {
    var navigateTo = await NavigationUtils.navigateTo(context, RegionsPage());
    print(navigateTo);
  }

  String getPlaceHolderImage() {
    return 'lib/imgs/globe.gif';
  }

  String getRegionImage() {
    return 'https://www.countryflags.io/PS/flat/64.png';
  }
}
