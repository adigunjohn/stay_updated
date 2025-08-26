import 'package:hive/hive.dart';

part 'saved_news.g.dart';

@HiveType(typeId: 0) // Unique ID for this class
class SavedNews {
  @HiveField(0)
  String author;
  @HiveField(1)
  String sourceName;
  @HiveField(2)
  String title;
  @HiveField(3)
  String description;
  @HiveField(4)
  String url;
  @HiveField(5)
  String urlImage;
  @HiveField(6)
  String publishedAt;
  @HiveField(7)
  String content;

  SavedNews(
      {required this.url,
      required this.publishedAt,
      required this.author,
      required this.description,
      required this.content,
      required this.sourceName,
      required this.title,
      required this.urlImage});
}
