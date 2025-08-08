import 'dart:developer';

import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier{
  AppThemeMode currentTheme = AppThemeMode.automatic;
  ThemeMode appThemeMode = ThemeMode.system;

  bool isLightTheme = false;
  bool isDarkTheme = false;
  bool isAutomaticTheme = true;
  int themeMessageIndex = 0;

final List themeMessages =[
  'Automatic mode activated',
  'Light mode activated',
  'Dark mode activated',
];

  void updateThemeMode(AppThemeMode theme){
    currentTheme = theme;
    log('message: $currentTheme');
    if(currentTheme == AppThemeMode.light){
      isLightTheme = true;
      isDarkTheme = false;
      isAutomaticTheme = false;
      themeMessageIndex = 1;
      appThemeMode = ThemeMode.light;
    }
    else if(currentTheme == AppThemeMode.dark){
      isLightTheme = false;
      isDarkTheme = true;
      isAutomaticTheme = false;
      themeMessageIndex = 2;
      appThemeMode = ThemeMode.dark;
    }
    else if(currentTheme == AppThemeMode.automatic){
      isLightTheme = false;
      isDarkTheme = false;
      isAutomaticTheme = true;
      themeMessageIndex = 0;
      appThemeMode = ThemeMode.system;
    }
    notifyListeners();
  }

}

enum AppThemeMode{
  automatic,
  light,
  dark
}
