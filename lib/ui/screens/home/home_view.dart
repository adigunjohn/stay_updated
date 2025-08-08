import 'dart:developer';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';
import 'package:stay_updated/ui/custom_widgets/carousel_widget.dart';
import 'package:stay_updated/ui/custom_widgets/menu_button.dart';
import 'package:stay_updated/ui/custom_widgets/recommendation_card.dart';
import 'package:stay_updated/ui/screens/home/home_view_model.dart';
import 'package:stay_updated/ui/screens/profile/profile_view.dart';
import 'package:stay_updated/ui/screens/search/search_view.dart';
import 'package:stay_updated/ui/screens/settings/settings_view.dart';
import 'package:stay_updated/ui/screens/view_all/view_all_view.dart';
import 'package:stay_updated/ui/screens/view_all/view_all_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: screenWidth(context),
            height: screenHeight(context),
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0, right: 0, left: 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuButton(
                          icon: Icons.person_rounded,
                          onTap: () {
                            locator<NavigationService>().pushNamed(ProfileView.id);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuButton(
                              icon: Icons.search_rounded,
                              onTap: () {
                                locator<NavigationService>().pushNamed(SearchView.id);
                              },
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            MenuButton(
                              icon: Icons.settings,
                              onTap: () {
                                locator<NavigationService>().pushNamed(SettingsView.id);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Breaking News',
                          style: kTTitleText,
                        ),
                        InkWell(
                            onTap: () {
                              locator<NavigationService>().push(const ViewAllView(viewAll: ViewAll.breakingNews,));
                            },
                            child: Text(
                              'View all',
                              style: kTBoldSubtitleText.copyWith(color: kCBlueColor),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CarouselWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedSmoothIndicator(
                      activeIndex: model.activeCarouselIndex,
                      count: model.carouselImages.length,
                      effect: ExpandingDotsEffect(
                        dotColor: kCGreyColor,
                        activeDotColor: kCBlueColor,
                        dotWidth: 9,
                        dotHeight: 9,
                        expansionFactor: 2.5,
                      ),
                      onDotClicked: (index) {}),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recommendation',
                          style: kTTitleText,
                        ),
                        InkWell(
                            onTap: () {
                              locator<NavigationService>().push(const ViewAllView(viewAll: ViewAll.recommendation,));
                            },
                            child: Text(
                              'View all',
                              style: kTBoldSubtitleText.copyWith(color: kCBlueColor),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: RecommendationCard(),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
