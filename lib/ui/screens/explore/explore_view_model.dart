import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stay_updated/models/news.dart';
import 'package:stay_updated/ui/common/strings.dart';

import '../../../app/locator.dart';
import '../../../services/http_service.dart';

class ExploreViewModel extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final List<String> tabList = [
    'All', //All -- General
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  int tabIndex = 0;
  void updateTabIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }

  List<News> general = [
    // News(
    //     author: 'author',
    //     content: 'content',
    //     description: 'description',
    //     publishedAt: 'publishedAt',
    //     sourceName: 'sourceName',
    //     title: 'title',
    //     url: 'url',
    //     urlImage: 'urlImage'),
  ];
  List<News> business = [];
  List<News> entertainment = [];
  List<News> health = [];
  List<News> science = [];
  List<News> sports = [];
  List<News> technology = [];

  List<List<News>> tabNews = [];

  void addAllList() {
    tabNews = [
      general,
      business,
      entertainment,
      health,
      science,
      sports,
      technology
    ];
    notifyListeners();
  }

  bool isExploreLoading = false;
  String? exploreErrorMessage;
  final api = locator<HttpService>();

  Future<void> fetchExploreNews() async {
    isExploreLoading = true;
    notifyListeners();
    try {
      for (String category in tabList){
        if(category == 'All'){
          category = 'General';
        }
        log(category);
        final fetchedCategoryNews = await api.fetchNews(AppStrings.categoryEndpoint(category: category.toLowerCase()));
        List<dynamic> result = fetchedCategoryNews['articles'];
        if(category == 'General'){
          general = result.map((e)=>News.fromJson(e)).toList();
          log('general news fetch -- message: ${general.length}');
        } else if(category == 'Business'){
          business = result.map((e)=>News.fromJson(e)).toList();
          log('business news fetch -- message: ${business.length}');
        } else if(category == 'Entertainment'){
          entertainment = result.map((e)=>News.fromJson(e)).toList();
          log('entertainment news fetch -- message: ${entertainment.length}');
        } else if(category == 'Health'){
          health = result.map((e)=>News.fromJson(e)).toList();
          log('health news fetch -- message: ${health.length}');
        } else if(category == 'Science'){
          science = result.map((e)=>News.fromJson(e)).toList();
          log('science news fetch -- message: ${science.length}');
        } else if(category == 'Sports'){
          sports = result.map((e)=>News.fromJson(e)).toList();
          log('sports news fetch -- message: ${sports.length}');
        } else if(category == 'Technology'){
          technology = result.map((e)=>News.fromJson(e)).toList();
          log('technology news fetch -- message: ${technology.length}');
        } else {
          log('message: $category does not equate to any tablist category');
        }
      }
    } catch (e) {
      exploreErrorMessage = e.toString();
    } finally {
      isExploreLoading = false;
    }
    notifyListeners();
  }
}
