import 'package:flutter/material.dart';

class ExploreViewModel extends ChangeNotifier{

  final List<String> tabList = [
    'All',
    'Politics',
    'Sports',
    'Education',
    'Games',
  ];

  int tabIndex = 0;
  void updateTabIndex(int index){
    tabIndex = index;
    notifyListeners();
  }

}