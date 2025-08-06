import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';
import 'package:stay_updated/ui/custom_widgets/recommendation_card.dart';
import 'package:stay_updated/ui/custom_widgets/tabbar_widget.dart';
import 'package:stay_updated/ui/screens/explore/explore_view_model.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});
  static const String id = 'ExploreView';
  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              height: screenHeight(context),
              width: screenWidth(context),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Discover', style: kTBigText,),
                    const SizedBox(height: 4,),
                    Text('News from all around the world', style: kTBodyText1.copyWith(color: kCNormalGreyColor),),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          scrollDirection: Axis.horizontal,
                          itemCount: model.tabList.length,
                          itemBuilder: (_, index) {
                            var e = model.tabList[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 9.0),
                              child: TabWidget(
                                  tabText: e,
                                  onTap: () {
                                    model.updateTabIndex(index);
                                  },
                                  isCurrentIndex: model.tabIndex == index),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: IndexedStack(
                        index: model.tabIndex,
                        children: List.generate(model.tabList.length,(index) => ListView(
                          scrollDirection: Axis.vertical,
                          children: List.generate(7,(index) => const RecommendationCard()),
                        )),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
