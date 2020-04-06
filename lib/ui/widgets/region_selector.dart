import 'package:flutter/material.dart';

class RegionSelector extends StatefulWidget {
  Function onRegionSelected;

  RegionSelector({@required this.onRegionSelected});

  @override
  _RegionSelectorState createState() => _RegionSelectorState();
}

class _RegionSelectorState extends State<RegionSelector> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onRegionSelected("hello");
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 5,
        child: ListTile(
          leading: FadeInImage.assetNetwork(
            placeholder: 'lib/imgs/globe.gif',
            image: 'https://www.countryflags.io/PS/flat/64.png',
            width: 50,
          ),
          title: Text('Palestine'),
          subtitle: Text('123,534 Confirmed case'),
        ),
        color: Colors.white.withOpacity(.85),
      ),
    );
  }
}
