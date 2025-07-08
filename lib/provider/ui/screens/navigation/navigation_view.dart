import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_updated/provider/ui/common/styles.dart';
import 'package:stay_updated/provider/ui/common/ui_helpers.dart';
import 'package:stay_updated/provider/ui/custom_widgets/nav_bar.dart';
import 'package:stay_updated/provider/ui/screens/bookmark/bookmark_view.dart';
import 'package:stay_updated/provider/ui/screens/explore/explore_view.dart';
import 'package:stay_updated/provider/ui/screens/home/home_view.dart';
import 'package:stay_updated/provider/ui/screens/navigation/navigation_view_model.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});
  static const String id = 'NavigationView';

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: IndexedStack(
            index: model.activeIndex,
            children: const [
              HomeView(),
              ExploreView(),
              BookmarkView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.activeIndex,
              onTap: (index){
              model.updateIndex(index);
              },
              type: BottomNavigationBarType.shifting,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, color: kCNormalGreyColor, size: IconSize.bottomNavBarIcon,),
                  activeIcon: const NavBarActiveItem(icon: Icons.home_filled, text: 'Home',),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined, color: kCNormalGreyColor, size: IconSize.bottomNavBarIcon,),
                  activeIcon: const NavBarActiveItem(icon: Icons.category_rounded, text: 'Xplore',),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border_outlined, color: kCNormalGreyColor, size: IconSize.bottomNavBarIcon,),
                  activeIcon: const NavBarActiveItem(icon: Icons.bookmark, text: 'Bookmarks',),
                  label: '',
                ),
              ]
          ),
        );
      }
    );
  }
}

