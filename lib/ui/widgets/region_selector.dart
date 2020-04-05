import 'package:flutter/material.dart';

class RegionSelector extends StatefulWidget {
  @override
  _RegionSelectorState createState() => _RegionSelectorState();
}

class _RegionSelectorState extends State<RegionSelector> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
        trailing: Icon(Icons.arrow_drop_down_circle,
            color: Colors.redAccent, size: 32),
      ),
      color: Colors.white.withOpacity(.85),
    );
  }
}
