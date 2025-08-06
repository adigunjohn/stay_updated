import 'package:flutter/material.dart';

class NavigationViewModel extends ChangeNotifier {
  int activeIndex = 0;
  void updateIndex(int index){
    activeIndex = index;
    notifyListeners();
  }
}