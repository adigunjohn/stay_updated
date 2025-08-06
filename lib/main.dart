import 'package:flutter/material.dart';
import 'package:stay_updated/app/routes.dart';
import 'package:stay_updated/app/application.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/screens/bookmark/bookmark_view_model.dart';
import 'package:stay_updated/ui/screens/explore/explore_view_model.dart';
import 'package:stay_updated/ui/screens/home/home_view_model.dart';
import 'package:stay_updated/ui/screens/navigation/navigation_view_model.dart';
import 'package:stay_updated/ui/screens/news/news_view_model.dart';
import 'package:stay_updated/ui/screens/search/search_view_model.dart';
import 'package:stay_updated/ui/screens/splash_view.dart';
import 'app/locator.dart';
import 'package:provider/provider.dart';

import 'ui/screens/profile/profile_view_model.dart';
import 'ui/screens/settings/settings_view_model.dart';
import 'ui/screens/view_all/view_all_view_model.dart';

void main() {
  Application.initializeApp();
  runApp(const StayUpdatedApp());
}

class StayUpdatedApp extends StatelessWidget {
  const StayUpdatedApp({super.key});
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown,],
    // );
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
          ChangeNotifierProvider<NavigationViewModel>(create: (_) => NavigationViewModel()),
          ChangeNotifierProvider<BookmarkViewModel>(create: (_) => BookmarkViewModel()),
          ChangeNotifierProvider<ExploreViewModel>(create: (_) => ExploreViewModel()),
          ChangeNotifierProvider<NewsViewModel>(create: (_) => NewsViewModel()),
          ChangeNotifierProvider<ProfileViewModel>(create: (_) => ProfileViewModel()),
          ChangeNotifierProvider<SettingsViewModel>(create: (_) => SettingsViewModel()),
          ChangeNotifierProvider<ViewAllViewModel>(create: (_) => ViewAllViewModel()),
          ChangeNotifierProvider<SearchViewModel>(create: (_) => SearchViewModel()),
        ],
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: locator<NavigationService>().navigatorKey,
            onGenerateRoute: (settings) => generateRoute(settings),
            title: Application.appName,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              // useMaterial3: false,
            ),
            home: const SplashView(),
          );
        });
  }
}
