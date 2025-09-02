import 'package:flutter/material.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/hive_service.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel() {
    _initialize();
  }
  HiveService hive = locator<HiveService>();
  AppThemeMode currentTheme = AppThemeMode.automatic;
  ThemeMode? appThemeMode;

  bool isLightTheme = false;
  bool isDarkTheme = false;
  bool isAutomaticTheme = true;
  int themeMessageIndex = 0;

  final List themeMessages = [
    'Automatic mode activated',
    'Light mode activated',
    'Dark mode activated',
  ];

  void _initialize() {
    final themeMode = hive.getThemeMode() ?? ThemeMode.system;
    _setTheme(themeMode);
  }

  void _setTheme(ThemeMode themeMode) {
    appThemeMode = themeMode;
    switch (themeMode) {
      case ThemeMode.light:
        currentTheme = AppThemeMode.light;
        isLightTheme = true;
        isDarkTheme = false;
        isAutomaticTheme = false;
        themeMessageIndex = 1;
        break;
      case ThemeMode.dark:
        currentTheme = AppThemeMode.dark;
        isLightTheme = false;
        isDarkTheme = true;
        isAutomaticTheme = false;
        themeMessageIndex = 2;
        break;
      case ThemeMode.system:
      default:
        currentTheme = AppThemeMode.automatic;
        isLightTheme = false;
        isDarkTheme = false;
        isAutomaticTheme = true;
        themeMessageIndex = 0;
        break;
    }
    notifyListeners();
  }

  void updateThemeMode(AppThemeMode theme) {
    ThemeMode themeMode;
    switch (theme) {
      case AppThemeMode.light:
        themeMode = ThemeMode.light;
        break;
      case AppThemeMode.dark:
        themeMode = ThemeMode.dark;
        break;
      case AppThemeMode.automatic:
      default:
        themeMode = ThemeMode.system;
        break;
    }
    hive.updateThemeMode(theme: themeMode);
    _setTheme(themeMode);
  }
}

enum AppThemeMode { automatic, light, dark }


//import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:stay_updated/app/locator.dart';
// import 'package:stay_updated/services/hive_service.dart';
//
// class SettingsViewModel extends ChangeNotifier {
//   HiveService hive = locator<HiveService>();
//   AppThemeMode currentTheme = AppThemeMode.automatic;
//   ThemeMode? appThemeMode = locator<HiveService>().getThemeMode();
//
//     bool isLightTheme = false;
//     bool isDarkTheme = false;
//     bool isAutomaticTheme = true;
//     int themeMessageIndex = 0;
//
//     final List themeMessages = [
//       'Automatic mode activated',
//       'Light mode activated',
//       'Dark mode activated',
//     ];
//
//     void updateThemeMode(AppThemeMode theme) {
//       currentTheme = theme;
//       log('message: $currentTheme');
//       if (currentTheme == AppThemeMode.light) {
//         isLightTheme = true;
//         isDarkTheme = false;
//         isAutomaticTheme = false;
//         themeMessageIndex = 1;
//         hive.updateThemeMode(theme: ThemeMode.light);
//         appThemeMode = ThemeMode.light;
//       } else if (currentTheme == AppThemeMode.dark) {
//         isLightTheme = false;
//         isDarkTheme = true;
//         isAutomaticTheme = false;
//         themeMessageIndex = 2;
//         hive.updateThemeMode(theme: ThemeMode.dark);
//         appThemeMode = ThemeMode.dark;
//       } else if (currentTheme == AppThemeMode.automatic) {
//         isLightTheme = false;
//         isDarkTheme = false;
//         isAutomaticTheme = true;
//         themeMessageIndex = 0;
//         hive.updateThemeMode(theme: ThemeMode.system);
//         appThemeMode = ThemeMode.system;
//       }
//       notifyListeners();
//     }
//   }
//
//
// enum AppThemeMode { automatic, light, dark }