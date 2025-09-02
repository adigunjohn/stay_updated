import 'package:flutter/material.dart';
import 'package:stay_updated/services/connectivity_service.dart';

class NavigationViewModel extends ChangeNotifier {
  int activeIndex = 0; //HomeView
  void updateIndex(int index){
    activeIndex = index;
    notifyListeners();
  }

  Future<void> checkInternetConnection() async {
    final isConnected = await ConnectivityService.hasInternetConnection();
    if (isConnected == false) {
      activeIndex = 2; //BookmarkView
      notifyListeners();
      return;
    }
    activeIndex = 0; //HomeView
    notifyListeners();
  }

}