import 'package:flutter/material.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/models/news.dart';
import '../../../services/hive_service.dart';

class BookmarkViewModel extends ChangeNotifier {
 BookmarkViewModel(){
   fetchSavedNews();
 }
 HiveService hive = locator<HiveService>();
 final ScrollController scrollController = ScrollController();

 List<News> bookMarkedNews = [];
 void fetchSavedNews(){
   final temp = HiveService.savedBookmarkedNews.values.toList();
   bookMarkedNews = temp.map((e) => News(author: e.author, content: e.content, description: e.description, publishedAt: e.publishedAt, sourceName: e.sourceName, title: e.title, url: e.url, urlImage: e.urlImage)).toList();
   notifyListeners();
 }

 void deleteNews(News news){
   hive.deleteBookmarkedNews(key: news.title);
   fetchSavedNews();
   notifyListeners();
 }

}