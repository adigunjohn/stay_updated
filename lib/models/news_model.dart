
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
        author: json['author'] ?? 'np',
        content: json['content'] ?? 'np',
        description: json['description'] ?? 'np',
        publishedAt: json['publishedAt'] ?? 'np',
        sourceName: json['source']['name'] ?? 'np',
        title: json['title'] ?? 'np',
        url: json['url'] ?? 'np',
        urlImage: json['urlToImage'] ?? 'np'
    );
  }
}