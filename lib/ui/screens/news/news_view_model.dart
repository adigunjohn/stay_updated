import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/models/news.dart';
import 'package:stay_updated/models/saved_news.dart';
import 'package:stay_updated/services/connectivity_service.dart';
import 'package:stay_updated/services/hive_service.dart';
import 'package:stay_updated/services/snackbar_service.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsViewModel extends ChangeNotifier {
  HiveService hive = locator<HiveService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  bool checkIfNewsIsBookmarked(News news) {
    final checkIfBookmarked = HiveService.savedBookmarkedNews.containsKey(news.title);
   return checkIfBookmarked;
  }

  void saveNews(News news) {
    final toBeSavedNews = SavedNews(
        url: news.url,
        publishedAt: news.publishedAt,
        author: news.author,
        description: news.description,
        content: news.content,
        sourceName: news.sourceName,
        title: news.title,
        urlImage: news.urlImage);
    if(checkIfNewsIsBookmarked(news)){
      hive.deleteBookmarkedNews(key: news.title);
      log('News successfully unbookmarked: ${news.title}');
      notifyListeners();
      return;
    }
    hive.updateBookmarkedNews(key: news.title, news: toBeSavedNews);
    log('News successfully bookmarked: ${news.title}');
    notifyListeners();
  }

  bool? isConnected;
  Future<void> checkInternetConnection() async{
    final value = await ConnectivityService.hasInternetConnection();
    isConnected = value;
    notifyListeners();
  }

  Future<void> launchInBrowserView(String url) async {
    await checkInternetConnection();
    if(isConnected == true){
      if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView)) {
        throw Exception('Could not launch $url');
      }
    }else {
      _snackbarService.showSnackbar(
        message: 'No internet connection',
        icon: Icons.wifi_off,
      );
    }

  }
}
