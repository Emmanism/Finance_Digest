class News {
  final String category;
  final int datetime;
  final String headline;
  final int id;
  final String image;
  final String related;
  final String source;
  final String summary;
  final String url;

  News({
    required this.category,
    required this.datetime,
    required this.headline,
    required this.id,
    required this.image,
    required this.related,
    required this.source,
    required this.summary,
    required this.url,
  });

  
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      category: json['category'],
      datetime: json['datetime'], 
      headline: json['headline'],
      id: json['id'],
      image: json['image'],
      related: json['related'],
      source: json['source'],
      summary: json['summary'],
      url: json['url'],
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'datetime': datetime, 
      'headline': headline,
      'id': id,
      'image': image,
      'related': related,
      'source': source,
      'summary': summary,
      'url': url,
    };
  }
}