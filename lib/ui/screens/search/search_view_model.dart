import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stay_updated/ui/common/strings.dart';

import '../../../app/locator.dart';
import '../../../models/news.dart';
import '../../../services/http_service.dart';

class SearchViewModel extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  final List<String> filterCategory = [
    'popularity',
    'publishedAt',
    'relevancy',
  ];

  String selectedFilterCategory = 'popularity';

  void updateSelectedFilterCategory(String category) {
    if (selectedFilterCategory != category) {
      selectedFilterCategory = category;
      log('Selected filter category: $selectedFilterCategory');
      notifyListeners();
    }
  }
  final api = locator<HttpService>();

  bool isSearchLoading = false;
  bool isVisible = false;
  String? searchedWord;
  String? searchErrorMessage;
  void updateIsVisible(bool update){
    isVisible = update;
    notifyListeners();
  }

  List<News> searchResult =[];

  Future<void> fetchSearchResult() async {
    isVisible = true;
    isSearchLoading = true;
    searchErrorMessage = null;
    notifyListeners();
    try{
      if(searchController.text.isNotEmpty){
        searchedWord = searchController.text;
        final fetchedSearchNews = await api.fetchNews(AppStrings.searchEndpoint(query: searchController.text, filter: selectedFilterCategory));
        List<dynamic> result = fetchedSearchNews['articles'];
        searchResult = result.map((e)=> News.fromJson(e)).toList();
        log('search news fetch -- message: ${searchResult.length}');
      }
      else{
        log('search news fetch -- message: the query parameter is empty');
      }
    }
    catch(e){
      searchErrorMessage = e.toString();
      log('search news fetch -- message: $e');
    }
    finally{
      isSearchLoading = false;
    }
    notifyListeners();
  }

}
