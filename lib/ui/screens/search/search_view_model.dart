import 'dart:developer';

import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier{
  TextEditingController searchController = TextEditingController();

  final List<String> filterCategory = [
    'All',
    'Politics',
    'Sports',
    'Education',
    'Games',
  ];

  String selectedFilterCategory = 'All';

  void updateSelectedFilterCategory(String category) {
    if (selectedFilterCategory != category) {
      selectedFilterCategory = category;
      log('Selected filter category: $selectedFilterCategory');
      notifyListeners();
    }
  }

}