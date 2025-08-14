
class News{
  final String author;
  final String sourceName;
  final String title;
  final String description;
  final String url;
  final String urlImage;
  final String publishedAt;
  final String content;

  News({
    required this.author,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.sourceName,
    required this.title,
    required this.url,
    required this.urlImage
  });

  factory News.fromJson(Map<String, dynamic> json){
    return News(
        author: json['author'] ?? 'unknown',
        content: json['content'] ?? 'no content',
        description: json['description'] ?? 'nil',
        publishedAt: json['publishedAt'] ?? 'nil',
        sourceName: json['source']['name'] ?? 'unknown',
        title: json['title'] ?? 'nil',
        url: json['url'] ?? 'https://www.google.com',
        urlImage: json['urlToImage'] ?? 'https://placehold.jp/120x120.png' //?? 'np'
    );
  }
}