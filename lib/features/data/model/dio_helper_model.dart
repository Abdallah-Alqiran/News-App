class ArticlesModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  ArticlesModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles:
          List.from(
            json['articles'],
          ).map((article) => ArticleModel.fromJson(article)).toList(),
    );
  }
}

class ArticleModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  ArticleModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? ''
    );
  }
}
