import 'package:flutter/material.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/screens/bookmark/bookmark_view.dart';
import 'package:stay_updated/ui/screens/explore/explore_view.dart';
import 'package:stay_updated/ui/screens/home/home_view.dart';
import 'package:stay_updated/ui/screens/navigation/navigation_view.dart';
import 'package:stay_updated/ui/screens/news/news_view.dart';
import 'package:stay_updated/ui/screens/prehome_view.dart';
import 'package:stay_updated/ui/screens/profile/profile_view.dart';
import 'package:stay_updated/ui/screens/search/search_view.dart';
import 'package:stay_updated/ui/screens/settings/settings_view.dart';
import 'package:stay_updated/ui/screens/splash_view.dart';
import 'package:stay_updated/ui/screens/view_all/view_all_view.dart';

Route<RouteSettings> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashView.id:
      return MaterialPageRoute(builder: (_) => const SplashView(),
      );
    case HomeView.id:
      return MaterialPageRoute(builder: (_) => const HomeView(),
      );
    case PreHomeView.id:
      return MaterialPageRoute(builder: (_) => const PreHomeView(),
      );
    case NavigationView.id:
      return MaterialPageRoute(builder: (_) => const NavigationView(),
      );
    case BookmarkView.id:
      return MaterialPageRoute(builder: (_) => const BookmarkView(),
      );
    case ExploreView.id:
      return MaterialPageRoute(builder: (_) => const ExploreView());
    case NewsView.id:
      return MaterialPageRoute(builder: (_) => const NewsView());
    case ProfileView.id:
      return MaterialPageRoute(builder: (_) => const ProfileView());
    case SearchView.id:
      return MaterialPageRoute(builder: (_) => const SearchView());
    case SettingsView.id:
      return MaterialPageRoute(builder: (_) => const SettingsView());
    case ViewAllView.id:
      return MaterialPageRoute(builder: (_) => const ViewAllView());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Unknown page; go back.', style: kTTitleText,)),
        ),
      );
  }
}
