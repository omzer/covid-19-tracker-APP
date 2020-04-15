import 'package:auto_animated/auto_animated.dart' as AnimatedLists;
import 'package:covidtracker/models/case_model.dart';
import 'package:covidtracker/ui/widgets/case_item.dart';
import 'package:flutter/material.dart';

class AnimatedCasesList extends StatelessWidget {
  List<CaseModel> list;

  AnimatedCasesList({this.list});

  @override
  Widget build(BuildContext context) {
    var options = AnimatedLists.LiveOptions(
      // Start animation after (default zero)
      delay: Duration(milliseconds: 50),
      showItemInterval: Duration(milliseconds: 100),
      showItemDuration: Duration(milliseconds: 250),
      visibleFraction: 0.05,

      reAnimateOnVisibility: false,
    );

    return Expanded(
      child: AnimatedLists.LiveList.options(
        options: options,
        itemBuilder: (context, index, animation) => buildAnimatedItem(
          context,
          index,
          animation,
          list[index],
        ),
        scrollDirection: Axis.vertical,
        itemCount: list.length,
      ),
    );
  }

  Widget buildAnimatedItem(context, index, animation, caseModel) {
    // For example wrap with fade transition
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-0.1, -0.05),
          end: Offset.zero,
        ).animate(animation),
        // Paste you Widget
        child: CaseItem(caseModel: caseModel),
      ),
    );
  }
}
