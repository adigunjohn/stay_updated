import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stay_updated/models/saved_news.dart';
import 'package:stay_updated/models/saved_theme.dart';
import 'package:stay_updated/ui/common/strings.dart';

class HiveService{
  static Future<void> initializeHive()async {
    await Hive.initFlutter();
    Hive.registerAdapter(ThemeModeAdapter());
    Hive.registerAdapter(SavedNewsAdapter());
    await Hive.openBox<SavedNews>(AppStrings.bookmarkedNews);
    await Hive.openBox<ThemeMode>(AppStrings.themeSettings);
    await Hive.openBox<SavedNews>(AppStrings.offlineNews);
    log('hive successfully initialized');
  }

  static Box<SavedNews> savedBookmarkedNews = Hive.box(AppStrings.bookmarkedNews);
  static Box<SavedNews> offlineSavedNews = Hive.box(AppStrings.offlineNews);
  static Box<ThemeMode> themeSettingsStorage = Hive.box(AppStrings.themeSettings);

    ThemeMode? getThemeMode() {
    try {
      return themeSettingsStorage.get(AppStrings.themeKey, defaultValue: ThemeMode.system);
    } catch (e) {
      log('getThemeMode failed: $e');
      return null;
    }
  }

  SavedNews? getBookmarkedNews(String key) {
    try {
      return savedBookmarkedNews.get(key);
    } catch (e) {
      log('Get Bookmarked News storage failed: $e');
      return null;
    }
  }

  SavedNews? getOfflineNews(String key) {
    try {
      return offlineSavedNews.get(key);
    } catch (e) {
      log('Get Offline News storage failed: $e');
      return null;
    }
  }

  void updateThemeMode({required ThemeMode theme}) {
      themeSettingsStorage.put(AppStrings.themeKey, theme);
      log('theme mode updated to $theme');
  }

  void updateBookmarkedNews({required String key, required SavedNews news}) {
      savedBookmarkedNews.put(key, news);
      log('Bookmarked News storage updated: $key -- $news');
  }

  void updateOfflineNews({required String key, required SavedNews news}) {
    offlineSavedNews.put(key, news);
    log('Offline News storage updated: $key -- $news');
  }


  void deleteBookmarkedNews({required String key}) {
      savedBookmarkedNews.delete(key);
      log('Bookmarked News storage deleted: $key');
  }

  void deleteOfflineNews({required String key}) {
    offlineSavedNews.delete(key);
    log('Offline News storage deleted: $key');
  }

  // Future<void> clearThemeSettingsStorage() async {
  //   await themeSettingsStorage.clear();
  //   log('Theme settings storage has been cleared');
  // }

  Future<void> clearBookmarkedNews() async {
    await savedBookmarkedNews.clear();
    log('Bookmarked News storage has been cleared');
  }

  Future<void> clearOfflineNews() async {
    await offlineSavedNews.clear();
    log('Offline News storage has been cleared');
  }

  static Future<void> closeHive() async {
    await Hive.close();
    log('All opened local storage boxes have been closed');
  }

}



///flutter pub run build_runner build