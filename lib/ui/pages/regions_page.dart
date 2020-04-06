import 'package:auto_animated/auto_animated.dart' as animatedLists;
import 'package:covidtracker/models/region_info.dart';
import 'package:covidtracker/repo/api.dart';
import 'package:covidtracker/ui/widgets/world_loading.dart';
import 'package:covidtracker/utils/assets_utils.dart';
import 'package:covidtracker/utils/decoration_utils.dart';
import 'package:covidtracker/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

class RegionsPage extends StatelessWidget {
  BuildContext _context;
  String _result = 'PS';
  final scrollController = ScrollController();
  final options = animatedLists.LiveOptions(
    showItemInterval: Duration(milliseconds: 50),
    // Animation duration (default 250)
    showItemDuration: Duration(milliseconds: 250),

    visibleFraction: 0.25,
    reAnimateOnVisibility: false,
  );

  @override
  Widget build(BuildContext context) {
    _context = context;
    return WillPopScope(
      onWillPop: _onPop,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(elevation: 0, title: Text('Select region:')),
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
    return animatedLists.LiveGrid.options(
      options: options,
      itemBuilder: (context, index, animation) =>
          _itemBuilder(animation, list[index]),
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
    );
  }

  Widget _itemBuilder(animation, region) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-0.1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: _buildRegionCard(region),
      ),
    );
  }

  Widget _buildRegionCard(RegionInfo region) {
    final double clipValue = 8;
    final Widget image = Image.asset(
      AssetsUtils.getJPGImagePath(region.name),
      fit: BoxFit.cover,
    );

    return Card(
      shape: DecorationUtils.getCardRoundedBorder(clipValue),
      elevation: 4,
      child: Column(
        children: <Widget>[
          DecorationUtils.clipTopWithRadius(image, clipValue),
          Text(region.name),
          Text('cases: ${region.cases}'),
        ],
      ),
    );
  }

  Future<bool> _onPop() async {
    NavigationUtils.popPageWithData(_context, _result);
    return false;
  }
}
