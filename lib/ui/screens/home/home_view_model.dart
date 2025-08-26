import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/models/news.dart';
import 'package:stay_updated/services/http_service.dart';
import 'package:stay_updated/ui/common/strings.dart';

class HomeViewModel extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  final api = locator<HttpService>();
  bool isBreakingNewsLoading = false;
  String? breakingNewsErrorMessage;

  bool isRecommendationNewsLoading = false;
  String? recommendationsNewsErrorMessage;

  List<News> breakingNews = [
    // News(author: 'author', content: 'content', description: 'description', publishedAt: '2025-08-03T21:00:22Z', sourceName: 'sourceName', title: 'title', url: 'url', urlImage: 'urlImage'),
    // News(author: 'author', content: 'content', description: 'description', publishedAt: '2024-08-13T21:00:22Z', sourceName: 'sourceName', title: 'title', url: 'url', urlImage: 'urlImage'),
    // News(author: 'author', content: 'content', description: 'description', publishedAt: '2025-07-13T21:00:22Z', sourceName: 'sourceName', title: 'title', url: 'url', urlImage: 'urlImage')
  ];
  List<News> recommendation = [];

  Future<void> fetchBreakingNews() async {
    isBreakingNewsLoading = true;
    breakingNewsErrorMessage = null;
    notifyListeners();
    try {
      final fetchedData = await api.fetchNews(AppStrings.breakingNewsEndpoint);
      final List<dynamic> fetchedNews = fetchedData['articles'];
      breakingNews = fetchedNews.map((e)=> News.fromJson(e)).toList();
      log('breaking news fetch -- message: ${breakingNews.length}');
    } catch (e) {
      log('breaking news fetch -- message: $e');
      breakingNewsErrorMessage = e.toString();
    } finally {
      isBreakingNewsLoading = false;
    }
    notifyListeners();
  }

  Future<void> fetchRecommendationNews() async {
    isRecommendationNewsLoading = true;
    recommendationsNewsErrorMessage = null;
    notifyListeners();

    try {
      final fetchedData = await api.fetchNews(AppStrings.recommendationsEndpoint);
      final List<dynamic> fetchedNews = fetchedData['articles'];
      recommendation = fetchedNews.map((e)=> News.fromJson(e)).toList();
      log('recommendation news fetch -- message: ${recommendation.length}');
    } catch (e) {
      log('recommendation news fetch -- message: $e');
      recommendationsNewsErrorMessage = e.toString();
    } finally {
      isRecommendationNewsLoading = false;
    }
    notifyListeners();
  }

  // final List<String> carouselImages = [
  //   'assets/pngs/news2.png',
  //   'assets/pngs/news2.png',
  //   'assets/pngs/news2.png',
  //   'assets/pngs/news2.png',
  //   'assets/pngs/news2.png',
  //   'assets/pngs/news2.png',
  //   'assets/pngs/news2.png',
  //   'assets/pngs/news2.png',
  //   'assets/pngs/news2.png',
  //   'assets/pngs/news2.png',
  //   'assets/pngs/news2.png',
  //
  //   // 'assets/svgs/news.svg',
  //   // 'assets/svgs/news.svg',
  //   // 'assets/svgs/news.svg',
  //   // 'assets/svgs/news.svg',
  //   // 'assets/svgs/news.svg',
  //   // 'assets/svgs/news.svg',
  //   // 'assets/svgs/news.svg',
  // ];

  int activeCarouselIndex = 0;
  void updateCarouselIndex(int index) {
    activeCarouselIndex = index;
    notifyListeners();
  }
}
