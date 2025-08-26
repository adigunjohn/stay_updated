import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:stay_updated/models/saved_news.dart';
import 'package:stay_updated/ui/common/strings.dart';

class HiveService {
  static Future<void> initializeHive()async {
    await Hive.initFlutter();
    Hive.registerAdapter(SavedNewsAdapter());
    await Hive.openBox<SavedNews>(AppStrings.stayUpdatedLocalStorage);
    await Hive.openBox<int?>(AppStrings.themeSettings);
  }

  static Box<SavedNews> newsLocalStorage = Hive.box(AppStrings.stayUpdatedLocalStorage);
  static Box<int?> themeSettingsStorage = Hive.box(AppStrings.themeSettings);

  int? getThemeModeIndex() {
    try {
      return themeSettingsStorage.get(AppStrings.themeIndex);
    } catch (e) {
      log('getThemeModeIndex failed: $e');
      return null;
    }
  }

  SavedNews? getNewsLocalStorage(String key) {
    try {
      return newsLocalStorage.get(key);
    } catch (e) {
      log('getNewsLocalStorage failed: $e');
      return null;
    }
  }

  void updateThemeModeIndex({required int index}) {
      themeSettingsStorage.put(AppStrings.themeIndex, index);
      log('theme index updated to $index');
  }

  void updateNewsLocalStorage({required String key, required SavedNews news}) {
      newsLocalStorage.put(key, news);
      log('newsLocalStorage updated: $key -- $news');
  }

  void deleteNewsLocalStorage({required String key}) {
      newsLocalStorage.delete(key);
      log('newsLocalStorage deleted: $key');
  }

  // Future<void> clearThemeSettingsStorage() async {
  //   await themeSettingsStorage.clear();
  //   log('Theme settings storage has been cleared');
  // }

  Future<void> clearLocalStorage() async {
    await newsLocalStorage.clear();
    log('News Local storage has been cleared');
  }

  static Future<void> closeHive() async {
    await Hive.close();
    log('All opened local storage boxes have been closed');
  }

}



