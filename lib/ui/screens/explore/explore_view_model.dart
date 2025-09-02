import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stay_updated/models/news.dart';
import 'package:stay_updated/services/connectivity_service.dart';
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
   await checkInternetConnection();
   if(isConnected == true){
     isExploreLoading = true;
     exploreErrorMessage = null;
     notifyListeners();

     int successfulFetches = 0;

     try {
       for (String category in tabList) {
         String apiCategory = category;
         if (apiCategory == 'All') {
           apiCategory = 'General';
         }

         try {
           log('Fetching news for: $apiCategory');
           final fetchedCategoryNews = await api.fetchNews(
               AppStrings.categoryEndpoint(category: apiCategory.toLowerCase()));
           List<dynamic> result = fetchedCategoryNews['articles'];

           if (apiCategory == 'General') {
             general = result.map((e) => News.fromJson(e)).toList();
             log('general news fetch -- success: ${general.length}');
           } else if (apiCategory == 'Business') {
             business = result.map((e) => News.fromJson(e)).toList();
             log('business news fetch -- success: ${business.length}');
           } else if (apiCategory == 'Entertainment') {
             entertainment = result.map((e) => News.fromJson(e)).toList();
             log('entertainment news fetch -- success: ${entertainment.length}');
           } else if (apiCategory == 'Health') {
             health = result.map((e) => News.fromJson(e)).toList();
             log('health news fetch -- success: ${health.length}');
           } else if (apiCategory == 'Science') {
             science = result.map((e) => News.fromJson(e)).toList();
             log('science news fetch -- success: ${science.length}');
           } else if (apiCategory == 'Sports') {
             sports = result.map((e) => News.fromJson(e)).toList();
             log('sports news fetch -- success: ${sports.length}');
           } else if (apiCategory == 'Technology') {
             technology = result.map((e) => News.fromJson(e)).toList();
             log('technology news fetch -- success: ${technology.length}');
           }
           successfulFetches++;
         } catch (e) {
           log('Failed to fetch news for category: $apiCategory. Error: $e');
         }
       }
     } catch (e) {
       exploreErrorMessage = e.toString();
     } finally {
       if (successfulFetches == 0) {
         exploreErrorMessage = 'Failed to load news. Please try again.';
       }
       isExploreLoading = false;
       addAllList();
     }
     notifyListeners();
   }
  }

  bool? isConnected;
  Future<void> checkInternetConnection() async{
    final value = await ConnectivityService.hasInternetConnection();
    isConnected = value;
    notifyListeners();
  }
}



//  Future<void> fetchExploreNews() async {
//     isExploreLoading = true;
//     notifyListeners();
//     try {
//       for (String category in tabList){
//         if(category == 'All'){
//           category = 'General';
//         }
//         log(category);
//         final fetchedCategoryNews = await api.fetchNews(AppStrings.categoryEndpoint(category: category.toLowerCase()));
//         List<dynamic> result = fetchedCategoryNews['articles'];
//         if(category == 'General'){
//           general = result.map((e)=>News.fromJson(e)).toList();
//           log('general news fetch -- message: ${general.length}');
//         } else if(category == 'Business'){
//           business = result.map((e)=>News.fromJson(e)).toList();
//           log('business news fetch -- message: ${business.length}');
//         } else if(category == 'Entertainment'){
//           entertainment = result.map((e)=>News.fromJson(e)).toList();
//           log('entertainment news fetch -- message: ${entertainment.length}');
//         } else if(category == 'Health'){
//           health = result.map((e)=>News.fromJson(e)).toList();
//           log('health news fetch -- message: ${health.length}');
//         } else if(category == 'Science'){
//           science = result.map((e)=>News.fromJson(e)).toList();
  //           log('science news fetch -- message: ${science.length}');
//         } else if(category == 'Sports'){
//           sports = result.map((e)=>News.fromJson(e)).toList();
//           log('sports news fetch -- message: ${sports.length}');
//         } else if(category == 'Technology'){
//           technology = result.map((e)=>News.fromJson(e)).toList();
//           log('technology news fetch -- message: ${technology.length}');
//         } else {
//           log('message: $category does not equate to any tablist category');
//         }
//       }
//     } catch (e) {
//       exploreErrorMessage = e.toString();
//     } finally {
//       isExploreLoading = false;
//     }
//     notifyListeners();
//   }