import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {

  final List<String> carouselImages = [
    'assets/pngs/news2.png',
    'assets/pngs/news2.png',
    'assets/pngs/news2.png',
    'assets/pngs/news2.png',
    'assets/pngs/news2.png',
    'assets/pngs/news2.png',
    'assets/pngs/news2.png',
    'assets/pngs/news2.png',
    'assets/pngs/news2.png',
    'assets/pngs/news2.png',
    'assets/pngs/news2.png',

    // 'assets/svgs/news.svg',
    // 'assets/svgs/news.svg',
    // 'assets/svgs/news.svg',
    // 'assets/svgs/news.svg',
    // 'assets/svgs/news.svg',
    // 'assets/svgs/news.svg',
    // 'assets/svgs/news.svg',
  ];

  int activeCarouselIndex = 0;
  void updateCarouselIndex(int index){
    activeCarouselIndex = index;
    notifyListeners();
  }
}