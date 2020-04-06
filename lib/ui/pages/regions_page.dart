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
      child: Scaffold(
        body: Center(
          child: WorldLoading(size: 80),
        ),
      ),
    );
  }

  Future<bool> _onPop() async {
    NavigationUtils.popPageWithData(_context, _result);
    return false;
  }
}
