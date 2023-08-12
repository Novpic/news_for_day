class ArticleEntity {

  final int? id;
  final String ? author;
  final String? title;
  final String ?description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String ?content;

  ArticleEntity({
    this.id,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
  

  factory ArticleEntity.fromJson(Map<String, dynamic> json) {
    return ArticleEntity(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
    };
  }
}