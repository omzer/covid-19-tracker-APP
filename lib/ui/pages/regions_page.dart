import 'package:covidtracker/models/region_info.dart';
import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:covidtracker/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

class RegionsPage extends StatelessWidget {
  BuildContext _context;
  String _result = 'PS';

  @override
  Widget build(BuildContext context) {
    _context = context;
    return WillPopScope(
      onWillPop: _onPop,
      child: SafeArea(
        child: Scaffold(
          body: _buildRegionsList(),
        ),
      ),
    );
  }

  Widget _buildRegionsList() {
    return FutureBuilder(
      future: API.getRegions(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return WorldLoading(size: 80);
        }
        return _buildRegionsGrid(snap.data);
      },
    );
  }

  Widget _buildRegionsGrid(List<RegionInfo> list) {
    return Text(list[0].name);
  }

  Future<bool> _onPop() async {
    NavigationUtils.popPageWithData(_context, _result);
    return false;
  }
}
